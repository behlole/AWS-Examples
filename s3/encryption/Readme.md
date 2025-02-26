## Create a bucket

```shell
aws s3 mb s3://behlole-encryption
```

## Create a file

```shell
echo "Hello World" > hello.txt
```

## Put Object with SSE-S3

```shell
aws s3 cp hello.txt s3://behlole-encryption/hello.txt
```

## Put Object with encryption SSE-KMS

```shell

aws s3api put-object --bucket=behlole-encryption --key=hello.txt --body=hello.txt \
--server-side-encryption=aws:kms \
--ssekms-key-id=94f0eeda-25de-4913-8394-6c0dd68573f0
```

## Download a file

```shell
aws s3 cp s3://behlole-encryption/hello.txt hello.txt
```

## Put Object with SSE-C with s3 sse-c

```shell
openssl rand -out ssec.key 32
aws s3 cp hello.txt s3://behlole-encryption --sse-c=AES256 --sse-c-key fileb://ssec.key
```

## Put Object with s3api sse-c

```shell
export ENCODED_KEY=$(openssl rand 32 | base64)
echo $ENCODED_KEY
export MD5_VALUE=$(echo -n $ENCODED_KEY | base64 --decode | md5sum | awk '{print $1}' | base64)
echo $MD5_VALUE
aws s3api put-object --bucket=behlole-encryption --key=hello.txt --body=hello.txt \
--sse-customer-algorithm=AES256 \
--sse-customer-key=fileb://ssec.key
```

## Download the file
```shell
aws s3 cp s3://behlole-encryption/hello.txt hello.txt --sse-c=AES256 --sse-c-key fileb://ssec.key
```
