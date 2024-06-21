
scopus_url = function(url, ...) {
  args = list(...)
  prs = httr::parse_url(url)
  prs$query$apiKey = scopus_token
  for (n in names(args)) prs$query[[n]] = args[[n]]
  httr::build_url(prs)
}

scopus_json = function(url, ...) {
  ret = httr::GET(scopus_url(url, ...), httr::accept_json())
  cont = httr::content(ret)[[1]]
  attr(cont,"headers") = ret$headers
  cont
}

scopus_links = function(data) {
  x = lapply(data$link, function(x) x$'@href')
  names(x) = sapply(data$link, function(x) if (is.null(x$'@ref')) x$'@rel' else x$'@ref')
  x
}

scopus_works = function(author_id) {
  ret = NULL
  url = paste0("https://api.elsevier.com/content/search/scopus?query=AU-ID(",author_id,")")
  data = scopus_json(url)
  if (as.numeric(data$`opensearch:totalResults`) == 0) return(ret)
  ret = c(ret, data$entry)
  links = scopus_links(data)
  while (! is.null(links$'next')) {
    url = links$'next'
    data = scopus_json(url)
    if (as.numeric(data$`opensearch:totalResults`) == 0) return(ret)
    ret = c(ret, data$entry)
    links = scopus_links(data)
  }
  if (length(ret) != as.numeric(data$`opensearch:totalResults`)) stop("Wrong number of results:", length(ret), "!=",data$`opensearch:totalResults` )
  ret
}

to_latin = function(x) stringi::stri_trans_general(x, id = "Latin-ASCII")
to_tag = function(x) stringi::stri_trans_tolower(to_latin(x))
null.is.na = function(x) if (is.null(x)) NA else x

id_map = function(id_type) {
  ret = do.call(rbind,lapply(seq_len(nrow(tab)), function(i) cbind(tab[[id_type]][[i]], tab$id[i])))
  ret = ret[!is.na(ret[,1]),]
  tmp = as.list(ret[,2]); names(tmp) = ret[,1]
  tmp
}

auto_id = function(x) paste(substr(to_latin(x$`ce:initials`),1,1), to_latin(x$`ce:surname`))
gen_id = function(x) { if (x$'@auid' %in% names(scopus_id_map)) scopus_id_map[[x$'@auid']] else auto_id(x)  }
pull_value = function(data,name) if (name %in% names(data)) data[[name]] else sapply(data, function(x) null.is.na(x[[name]]))
pull_links = function(data,name) sapply(data, function(x) null.is.na(scopus_links(x)[[name]]))
pull_list  = function(data,name) lapply(data, function(x) x[[name]])

rows = function(tab) lapply(seq_len(nrow(tab)), function(i) lapply(tab, "[[",i))


readPost = function(filename) {
  f = enc2utf8(readLines(filename))
  fm = which(f == "---")[1:2]
  if (length(fm) != 2) stop("wrong frontmatter delimiters")
  list(data = yaml::yaml.load(f[(fm[1]+1):(fm[2]-1)]), content = f[(fm[2]+1):length(f)])
}

writePost = function(post, filename, ...) {
  args = list(...)
  data_yaml = strsplit(yaml::as.yaml(post$data),"\n")[[1]]
  for (n in names(args)) {
    i = grep(paste0("^",n),data_yaml)
    data_yaml[i] = sprintf("%-50s # %s",data_yaml[i],args[[n]])
  }
  writeLines(c("---",data_yaml,"---",post$content),con = filename)
}

combine.list = function(a,b) {for (i in names(b)) a[[i]] = b[[i]]; a}

update.post = function(fn, data, content) {
  if (file.exists(fn)) {
    post = readPost(fn)
    if (is.null(post$data$auto_data)) post$data$auto_data = FALSE
    if (is.null(post$data$auto_content)) post$data$auto_content = FALSE
    if (is.null(post$data$redirect)) post$data$redirect = FALSE
    if (post$data$auto_data) { # true
      post$data = data
    } else {
      post$data = combine.list(data, post$data)
    }
  } else {
    post = list(data=data, concent=character(0))
  }
  
  if (post$data$auto_content) post$content = content
  
  if (! post$data$auto_content) post$data$auto_content = NULL
  if (! post$data$auto_data) post$data$auto_data = NULL
  if (post$data$redirect == FALSE) post$data$redirect = NULL
  dir.create(dirname(fn),recursive = TRUE,showWarnings = FALSE)
  writePost(post, fn,
            auto_content="DELETE THIS TO NOT AUTO GENERATE CONTENT",
            auto_data="DELETE THIS TO NOT AUTO GENERATE METADATA",
            redirect="DELETE THIS TO NOT REDIRECT")
}
