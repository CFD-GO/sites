
ft_links = works_tab$ft_url
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

fp = data.frame(pdf = dir("~/doi",recursive=TRUE,pattern="*.pdf"))
fp$doi = sub(".pdf$","",fp$pdf)
fp$pdf = paste0(Sys.getenv("HOME"),"/doi/",fp$doi,".pdf")
fp$png = paste0("static/img/doi/",fp$doi,"/firstpage.png")

sel = file.exists(fp$pdf) & (!file.exists(fp$png))
for (i in which(sel)) {
  dir.create(dirname(fp$png[i]),recursive = TRUE,showWarnings = FALSE)
  command = paste0("convert -density 150 -background white -alpha remove '",fp$pdf[i], "'[0] '",fp$png[i],"'")
  #command = paste0("gs -sDEVICE=png16m -r300 -dDownScaleFactor=4 -sOutputFile=",fp$png[i]," -dLastPage=1 ",fp$pdf[i])
  print(command)
  system(command=command)
}


