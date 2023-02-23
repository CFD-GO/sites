#install.packages("rcrossref")
#install.packages("rorcid")

id = c(
  "0000-0002-3026-5881",
  "0000-0001-6618-0532",
  "0000-0002-1302-4859",
  "0000-0001-8596-9125",
  "0000-0003-0183-5555"
)

person = rorcid::orcid_person(id)

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
