CarrierWave.configure do |config|

    config.fog_credentials = {
        :provider => 'AWS',
        :aws_access_key_id => ENV['aws_access_key_id'],
        :aws_secret_access_key => ENV['aws_secret_access_key'],
        :region => 'eu-west-1' # change
    }
    config.fog_directory = 'freddiesmedia' # change
    config.fog_public = true
end