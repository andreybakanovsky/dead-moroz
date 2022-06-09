Rails.application.reloader.to_prepare do
  # Autoload classes and modules needed at boot time here.
  Warden::Strategies.add(:api_token, ApiTokenStrategy)
end
