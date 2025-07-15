
tab = works_tab
tab = tab[!is.na(tab$doi),]
tab$pdf_path = paste0(Sys.getenv("HOME"),"/doi/",tab$doi,".pdf")
tab$png_path = paste0("static/img/doi/",tab$doi,"/firstpage.png")

sel = (!file.exists(tab$png_path)) & (!file.exists(tab$pdf_path))

for (i in which(sel)) {
  print(tab$doi[i])
  fn = tab$pdf_path[i]
  doi = tab$doi[i]
  ft_url = tab$ft_url[i]
  dir.create(dirname(fn),recursive = TRUE,showWarnings = FALSE)
  if (file.exists(fn)) { cat("exists\n"); next; }
  if (!is.na(ft_url)) {
    cat("Trying scopus url ...\n")
    url = paste0(sub("article","object",ft_url),"-main.pdf?httpAccept=*/*")
    try(curl::curl_download(scopus_url(url),fn))
  }
  if (file.exists(fn)) { cat("exists\n"); next; }
  if (!is.na(doi)) {
    cat("Trying doi2pdf ...\n")
    command = paste0("doi2pdf -o \"", fn, "\" --doi \"", doi,"\"")
    system(command=command)
  }
  if (file.exists(fn)) { cat("exists\n"); next; }
}

# fp = data.frame(pdf = dir("~/doi",recursive=TRUE,pattern="*.pdf"))

sel = (!file.exists(tab$png_path)) & (file.exists(tab$pdf_path))
for (i in which(sel)) {
  pdf_path = tab$pdf_path[i]
  png_path = tab$png_path[i]

  dir.create(dirname(png_path),recursive = TRUE,showWarnings = FALSE)
  command = paste0("convert -density 150 -background white -alpha remove '",pdf_path, "'[0] '",png_path,"'")
  #command = paste0("gs -sDEVICE=png16m -r300 -dDownScaleFactor=4 -sOutputFile=",fp$png[i]," -dLastPage=1 ",fp$pdf[i])
  print(command)
  system(command=command)
}
