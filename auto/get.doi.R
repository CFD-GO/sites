#install.packages("rcrossref")
#install.packages("rorcid")

# also Jon: 57192239242

tab=read.csv(na.strings = "NA", stringsAsFactors = FALSE,quote = '"',strip.white = TRUE, textConnection('
id,                           scopus_id,                  orcid,      tclb,            mcf,       ccfd
"C Leonardi",       "25646377900",  "0000-0001-8596-9125",        no,       lecturer,         no
"L Laniewski-Wollk",     "56719775800",  "0000-0002-3026-5881",    author,        postdoc,    adjunkt
"T Mitchell",            "57191284046",  "0000-0001-6618-0532",    mcontr,       lecturer,         no
"R Reisabadi",             "36731631700",                     NA,        no,   post-postdoc,         no
"A Roslin",           "56786451900",                     NA,        no,   post-postdoc,         no
"N Di Vaira",            "57215219080",  "0000-0002-1302-4859",     contr,            phd,         no
"B Hill",                 "57215223391",                     NA,      user,            phd,         no
"S Brennand", "57225237474,57104770100",  "0000-0003-4121-0218",        no,            phd,         no
"D Sashko",              "57305346800",  "0000-0002-3154-1083",     contr,            phd,         no
"I Lenane",                  "6506559458",                     NA,      user,            phd,         no
"J McCullough", "57611788200,57192239242",                     NA,      user,     alumni-phd,         no
"D Wang",                   "57200546044",  "0000-0002-2804-4369",      user,     alumni-phd,         no
"M Dzikowski",           "57188845641",  "0000-0001-5709-7235",    mcontr,             no, alumni-phd
'))

tab$scopus_id = strsplit(tab$scopus_id,",")

scopus_token = readLines("~/.scopus_token")

scopus_url = function(url, ...) {
  args = list(...)
  prs = httr::parse_url(url)
  prs$query$apiKey = scopus_token
  for (n in names(args)) prs$query[[n]] = args[[n]]
  httr::build_url(prs)
}

scopus_json = function(url, ...) {
  ret = httr::GET(scopus_url(url, ...), httr::accept_json())
  httr::content(ret)[[1]]
}

scopus_links = function(data) {
  x = lapply(data$link, function(x) x$'@href')
  names(x) = sapply(data$link, function(x) x$'@ref')
  x
}

scopus_works = function(author_id) {
  ret = NULL
  url = paste0("https://api.elsevier.com/content/search/scopus?query=AU-ID(",author_id,")")
  data = scopus_json(url)
  ret = c(ret, data$entry)
  links = scopus_links(data)
  while (! is.null(links$'next')) {
    url = links$'next'
    data = scopus_json(url)
    ret = c(ret, data$entry)
    links = scopus_links(data)
  }
  if (length(ret) != as.numeric(data$`opensearch:totalResults`)) stop("Wrong number of results")
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
pull_value = function(data,name) sapply(data, function(x) null.is.na(x[[name]]))
pull_links = function(data,name) sapply(data, function(x) scopus_links(x)[[name]])
pull_list  = function(data,name) lapply(data, function(x) x[[name]])

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


scopus_id_map = id_map("scopus_id")
orcid_map = id_map("orcid")

ids = do.call(c, tab$scopus_id)
works_tab = NULL
works = NULL
for (id in ids) {
  cat(scopus_id_map[[id]]," (",id,")\n", sep="")
  ret = scopus_works(id)
  works = c(works, ret)
}


works = works[!duplicated(pull_links(works, "self"))]
works_tab = data.frame(title=pull_value(works, 'dc:title'),
                       doi=pull_value(works, 'prism:doi'),
                       url=pull_links(works, "self"),
                       type=pull_value(works, 'subtypeDescription'),
                       stringsAsFactors = FALSE)

works_full = lapply(works_tab$url, function(url) {
  print(url)
  scopus_json(url)
})



ret = lapply(works_full, function(x) {
  data = list(
    doi=x$coredata$`prism:doi`,
    title=x$coredata$`dc:title`,
    authors=sapply(x$authors$author,gen_id),
    keywords=to_tag(pull_value(x$authkeywords$`author-keyword`,"$")),
    date=x$coredata$`prism:coverDate`,
    journal=x$coredata$`prism:publicationName`,
    publisher=x$coredata$`dc:publisher`,
    auto_content=TRUE,
    auto_data=TRUE
  )
  cat(data$doi,"...\n")
  
  data$redirect = paste0("https://doi.org/", data$doi) 
  
  realauthors = lapply(x$authors$author,function(x) paste(x$`ce:initials`,x$`ce:surname`))
  names(realauthors) = data$authors
  data$realauthors = realauthors
  

  au = sapply(names(realauthors), function(n) paste0("{{< author \"", n, "\" \"", realauthors[[n]],"\" >}}"))

  content = c(
    paste0(au, collapse=", "),
    "",
    "## Abstract",
    x$coredata$`dc:description`
  )
  
  fn = paste0("content/doi/",data$doi,".md")
  
  png = paste0("/img/doi/",data$doi,"/firstpage.png")
  if (file.exists(paste0("static",png))) {
    data$image = png
    data$showonlyimage = TRUE
  }
  
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
  fn
})



##### Download elsevier PDFs
ft_links =  sapply(works, function(x) null.is.na(scopus_links(x)$'full-text'))
sel = !is.na(ft_links) & !is.na(works_tab$doi)
for (i in which(sel)) {
  print(works_tab$doi[i])
  fn = paste0("~/doi/",works_tab$doi[i],".pdf")
  dir.create(dirname(fn),recursive = TRUE,showWarnings = FALSE)
  x = ft_links[i]
  url = paste0(sub("article","object",x),"-main.pdf?httpAccept=*/*")
  if (! file.exists(fn)) {
    try(curl::curl_download(scopus_url(url),fn))
  } else cat("exists\n")
}
#######



do.call(rbind,lapply(person,function(x) lapply(x$name,function(x) if (is.list(x)) x$value else x)))

ret = rorcid::orcid_works(id)
works = ret$`0000-0001-6618-0532`$works

get.doi = function(x) {
  doi = x$`external-id-value`[x$`external-id-type`=="doi"]
  if (length(doi) == 0) NA else doi[1]
}

works$doi = sapply(works$`external-ids.external-id`, get.doi)

cbind(works$type,works$doi)

doi = sapply(works$`external-ids.external-id`, get.doi)
doi = unique(doi)
doi = sort(doi[!is.na(doi)])

crworks = rcrossref::cr_works(doi)

crworks$data$author
crworks$data$created
crworks$data$abstract

works_tab$doi[1]
url = "https://api.crossref.org/works/10.1016/j.renene.2023.01.066"
ret = httr::GET(url, httr::accept_json())
ret = httr::content(ret)
ret$message$link
