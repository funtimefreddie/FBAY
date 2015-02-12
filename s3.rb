require 'aws-sdk'
 
bucket = "kintanmedia" #NOTE - CHANGE THIS
region = 'us-west-2' #"<enter your region>"
aws_key_id = "AKIAJJCYJ3CJQPVRL6FQ" #NOTE - CHANGE THIS
aws_key = "CfN0KZbdZjqKYIsox7mJuR/BuZstAehyFFpwXjRE" #NOTE - CHANGE THIS
 
credentials = Aws::Credentials.new(aws_key_id, aws_key)
s3 = Aws::S3::Client.new(credentials: credentials, region: region)
 
 
resp = s3.list_objects(bucket: bucket)
resp.contents.first(10).each do |object|
  #puts "#{object.key} => #{object.etag}"
  puts "https://#{bucket}.s3.amazonaws.com/#{object.key}"
end