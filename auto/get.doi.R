#install.packages("rcrossref")
#install.packages("rorcid")

# also Jon: 57192239242

rm(list=ls())

dir.create("cache/", recursive = TRUE)

source("auto/lib.R")
stfile = "~/.scopus_token"
if (file.exists(stfile)) {
  scopus_token = readLines(stfile)
} else {
  scopus_token = Sys.getenv("SCOPUS_TOKEN")
}

if (scopus_token == "") stop("No token")

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
"S Kubacki", "57675170600", NA, no, no, hab
"P Baj", "56720306300", "0000-0002-7480-7750", no, no, adjunkt
"T Bobinski", "56095852800", "0000-0003-0407-259X", no, no, adjunkt
"S Gepner", "36194760400", "0000-0002-5115-2165", no, no, adjunkt
"K Gumowski", "24341224700", "0000-0002-1751-0926", no, no, asystent
"L Klotz", "56192339300", "0000-0003-1740-7635", no, no, asystent
"Nikesh", "57195384063", "0000-0002-1423-8525", no, no, adjunkt
"J Szumbarski", "6506430104", "0000-0003-1176-106X", no, no, profesor
'))
tab$scopus_id = strsplit(tab$scopus_id,",")
scopus_id_map = id_map("scopus_id")
orcid_map = id_map("orcid")

ids = do.call(c, tab$scopus_id)
works = NULL
fn = "cache/works.Rdata"

if (file.exists(fn)) load(fn)
sel = setdiff(ids, names(works))
works[sel] = lapply(sel, function(id) {
  cat(scopus_id_map[[id]]," (",id,")\n", sep="")
  ret = scopus_works(id)
})
save(works,file=fn)

tmp = do.call(c, works)
tmp = tmp[!duplicated(pull_links(tmp, "self"))]
works_tab = data.frame(title=pull_value(tmp, 'dc:title'),
                       doi=pull_value(tmp, 'prism:doi'),
                       url=pull_links(tmp, "self"),
                       ft_url=pull_links(tmp, "full-text"),
                       type=pull_value(tmp, 'subtypeDescription'),
                       stringsAsFactors = FALSE)

works_full = NULL
fn = "cache/works_full.Rdata"

if (file.exists(fn)) load(fn)
sel = setdiff(works_tab$url, names(works_full))
works_full[sel] = lapply(sel, function(url) {
  print(url)
  ret = scopus_json(paste0(url,"?view=FULL"))
  if (! "authors" %in% names(ret)) stop("'authors' not in json")
  ret
})
save(works_full, file=fn)

works_tab$cite = as.numeric(sapply(works_full, function(x) x$coredata$`citedby-count`))
plot(seq(0,1,len=length(works_tab$cite)),cumsum(sort(works_tab$cite,dec=TRUE))/sum(works_tab$cite), ylim=c(0,1))
works_tab[order(works_tab$cite,decreasing = TRUE)[1:20],]

sel = (!is.na(works_tab$doi)) & duplicated(works_tab$doi)
other_tab = works_tab[sel,,drop=FALSE]
works_tab = works_tab[!sel,,drop=FALSE]
works_tab$other_url = lapply(works_tab$doi, function(doi) other_tab$url[which(other_tab$doi == doi)])

tclb_people = tab$id[tab$tclb != "no"]
mcf_people = tab$id[tab$mcf != "no"]

works_ids = lapply(works_full[works_tab$url], function(x) sapply(x$authors$author,gen_id))
sel = sapply(works_ids, function(x) any(x %in% c(tclb_people,mcf_people)))
tmp = works_tab
tmp$authors = sapply(works_ids, paste, collapse=", ")
tmp$date = sapply(works_full[works_tab$url], function(x) x$coredata$`prism:coverDate`)
tmp = tmp[sel,]
sel = !is.na(tmp$doi)
tmp = tmp[sel,]


if (file.exists("auto/cat.txt")) {
  ret = read.table("auto/cat.txt")
  names(ret) = c("doi","mcf","tclb")
  ret$mcf = ret$mcf != "_"
  ret$tclb = ret$tclb != "_"
  tmp = merge(tmp, ret, by= "doi")
  tmp$tclb[is.na(tmp$tclb)] = FALSE
  tmp$mcf[is.na(tmp$mcf)] = FALSE
} else {
  tmp$tclb = FALSE
  tmp$mcf = FALSE
}
l = paste0(sprintf("%-40s %s %s  ", tmp$doi, ifelse(tmp$mcf,"X","_"), ifelse(tmp$tclb,"X","_")), "# ",tmp$date, " ",tmp$authors, " -- ", tmp$title)
l = l[order(tmp$doi)]
writeLines(l, "auto/cat.txt")

tclb_pub = tmp$doi[tmp$tclb]
mcf_pub = tmp$doi[tmp$mcf]

#ret = lapply(works_full, function(x) {
ret = lapply(seq_len(nrow(works_tab)), function(k) {
  x = works_full[[ works_tab$url[k] ]]
  other_url = works_tab$other_url[[k]]
  pub_type = works_tab$type[k]
  cat(scopus_links(x$coredata)$self, x$coredata$`prism:doi`,"...\n")
  data = list(
    doi=x$coredata$`prism:doi`,
    title=x$coredata$`dc:title`,
    authors=sapply(x$authors$author,gen_id),
    keywords=to_tag(pull_value(x$authkeywords$`author-keyword`,"$")),
    date=x$coredata$`prism:coverDate`,
    journal=x$coredata$`prism:publicationName`,
    publisher=x$coredata$`dc:publisher`,
    scopus_cite=as.integer(x$coredata$`citedby-count`),
    pub_type=pub_type,
    auto_content=TRUE,
    auto_data=TRUE
  )
  
  if (!is.null(data$doi)) {
    if (data$doi %in% tclb_pub) {
      data$tclb = "publications"
    }
    if (data$doi %in% mcf_pub) {
      data$mcf = "publications"
    }
  }
    
  data$redirect = paste0("https://doi.org/", data$doi) 
  
  realauthors = lapply(x$authors$author,function(x) paste(x$`ce:initials`,x$`ce:surname`))
  names(realauthors) = data$authors
  realauthors = lapply(seq_along(realauthors),function(i) realauthors[i])
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
  update.post(fn, data, content)
  fn
})


ret = lapply(rows(tab), function(x) {
  fn = paste0("content/people/",gsub(" ","-",tolower(x$id)),"/index.md")
  data = list(
    short=x$id,
    title=x$id,
    redirect=FALSE,
    auto_content=TRUE,
    auto_data=TRUE
  )
  if (x$tclb != "no") {
    if (x$tclb == "user") {
      data$tclb = c("user")
    } else {
      data$tclb = c("people","user",x$tclb)
    }
  }
  if (x$mcf != "no") data$mcf = c("people",x$mcf)
  if (x$ccfd != "no") data$za = c("people",x$ccfd)
  data$scopus = x$scopus_id
  data$orcid = x$orcid
  content = c("","{{< publist >}}")
  update.post(fn, data, content)
})

