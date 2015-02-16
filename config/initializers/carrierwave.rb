CarrierWave.configure do |config|

    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => ENV['aws_access_key_id'],
        :aws_secret_access_key => ENV['aws_secret_access_key'],
        :region => ENV['aws_region'] # change
    }
    config.fog_directory = ENV['aws_bucket_name'] # change
    config.fog_public = true
end