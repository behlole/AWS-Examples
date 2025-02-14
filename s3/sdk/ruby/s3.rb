# rvm install 3.0.0
# bundle exec ruby s3.rb

require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
puts bucket_name

region = 'us-east-1'
client = Aws::S3::Client.new
resp = client.create_bucket({
                              bucket: bucket_name,
                            })
puts resp
number_of_files = 1 + rand(6)
puts number_of_files

number_of_files.times.each do |i|
  puts "i: #{i}"
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  File.open(output_path, "r") do |f|
    client.put_object(bucket: bucket_name, key: filename, body: f)
  end
end

