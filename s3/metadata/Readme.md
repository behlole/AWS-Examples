## Create a bucket

```shell
aws s3 mb s3://behlole-metadata
```
## Create a new file
```shell
echo "Hello Mars" > hello.txt
```

## Upload a file

```shell
aws s3api put-object --bucket="behlole-metadata" --key="hello.txt" --body="hello.txt" --metadata Planet="Mars"
```
## Get Metdata through head object
```shell
aws s3api head-object --bucket behlole-metadata --key="hello.txt"
```
