if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                                                 # required
      aws_access_key_id:     Rails.application.credentials.aws[:access_key_id],     # required unless using use_iam_profile
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key], # required unless using use_iam_profile
      region:                Rails.application.credentials.aws[:region],            # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = Rails.application.credentials.aws[:bucket]            # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file
  end
else
  CarrierWave.configure do |config|
    config.asset_host = "http://localhost:3000"
    config.storage = :file
    config.cache_storage = :file
  end
end
