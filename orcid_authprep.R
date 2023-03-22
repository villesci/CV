# copy/paste your client ID from https://orcid.org/developer-tools
orcid_client_id <- "APP-MHG77OW9C4KXUPF6"

# copy/paste your client secret from https://orcid.org/developer-tools
orcid_client_secret <- "ab5d96c6-ba20-4b9f-8002-2f8d731f095a"

orcid_request <- httr::POST(url  = "https://orcid.org/oauth/token",
                      config = httr::add_headers(`Accept` = "application/json",
                                           `Content-Type` = "application/x-www-form-urlencoded"),
                      body = list(grant_type = "client_credentials",
                                  scope = "/read-public",
                                  client_id = orcid_client_id,
                                  client_secret = orcid_client_secret),
                      encode = "form")

orcid_response <- httr::content(orcid_request)
print(orcid_response$access_token)

#usethis::edit_r_environ()
