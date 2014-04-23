require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "1022418167001-99jvupfrfbpu8c5qfplmmn6g205ji8nb.apps.googleusercontent.com", "VhmVPJJW88K-c7fOIWoVn3hg", {:redirect_path => "/fb_oauth/gmail_contacts", :ssl_ca_file => "/etc/ssl/certs/ca-certificates.crt"}
  # importer :yahoo, "consumer_id", "consumer_secret", {:callback_path => '/callback'}
  # importer :hotmail, "client_id", "client_secret"
  # importer :facebook, "client_id", "client_secret"
end