## Create a new bucket

```bash 
aws s3 mb s3://checksums-example
```

## Create a file that we will checksum on!

```bash
echo 'Hello Mars'>myfile.txt
```

## Get a checksum of md5

```bash
md5 myfile.txt
MD5 (myfile.txt) = 8ed2d86f12620cdba4c976ff6651637f
```

## Upload a file to aws

```shell
aws s3 cp myfile.txt s3://checksums-example
aws s3api head-object --bucket=checksums-example  --key=myfile.txt
```

## Let's upload a file with different kind of checksum
```sh
crc32 myfile.txt
openssl dgst -sha1 -binary myfile.txt | base64
aws s3api put-object --bucket=checksums-example  \
--key=myfile.txt --body=myfile.txt \
--checksum-algorithm="SHA1" \
--checksum-sha1="wozMLF4hQDaAYBTfn7Q2NPPncLI="
```
