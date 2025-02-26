## Create a bucket
```shell
aws s3 mb s3://behlole-encryption-client
```
## Create a file
```shell
echo "Hello World" > hello.txt
```
## Run our SDK Ruby script
```ruby
bundle exec ruby encrypt.rb
```
