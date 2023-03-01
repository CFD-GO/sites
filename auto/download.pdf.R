
ft_links = work_tab$ft_url
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
