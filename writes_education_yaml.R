orcid_auth(client_id="APP-MHG77OW9C4KXUPF6",client_secret="ab5d96c6-ba20-4b9f-8002-2f8d731f095a")


my_orcid<-"0000-0001-7303-5931"
works<-orcid_works(my_orcid)
cites<-orcid_citations(my_orcid,cr_format="citeproc-json")
edu<-orcid_educations(my_orcid)
edulist <- purrr::map(edu[[my_orcid]][["affiliation-group"]][["summaries"]], function(x) {
  list(
    name = paste0(snakecase::to_snake_case(paste(x[["education-summary.organization.name"]], x[["education-summary.end-date.year.value"]]))),
    type = "degree",
    title = x[["education-summary.role-title"]],
    university = x[["education-summary.organization.name"]],
    department = x[["education-summary.department-name"]],
    location  = paste0(x[["education-summary.organization.address.city"]], ", ", x[["education-summary.organization.address.region"]]),
    date = paste(
      x[["education-summary.end-date.year.value"]],
      x[["education-summary.end-date.month.value"]],
      x[["education-summary.end-date.day.value"]],
      sep = "-"))
})
names(edulist) <- purrr::map_chr(edulist, "name")
yaml::write_yaml(edulist, here::here("education.yaml"), handlers = list(Date = function(x) as.character (x)))

