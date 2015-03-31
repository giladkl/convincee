OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "386058058247863", "2f00ab5acacae218268bbf2ca3f6a970", {:client_options => {:ssl => {:verify => false}}}
end