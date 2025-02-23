## Create a bucket

```shell
aws s3 mb s3://behlole-cors
```

## Change block public access

```shell
aws s3api put-public-access-block \
--bucket behlole-cors \
--public-access-block-configuration="BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```shell
aws s3api put-bucket-policy --bucket=behlole-cors --policy file://policy.json
```

## Turn ON static website hosting

```shell
aws s3api put-bucket-website --bucket behlole-cors --website-configuration file://website.json
```

## Upload index.html file and include a file that will be cross-origin.

```shell
aws s3 cp index.html s3://behlole-cors/index.html
```

## Get the website endpoint for s3 bucket

http://behlole-cors.s3-website.us-east-1.amazonaws.com/

## Deploy to API Gateway a Mock Response

https://w5ldaybvcb.execute-api.us-east-1.amazonaws.com/prod

## Apply a CORS Policy.

```shell
aws s3api put-bucket-cors --bucket behlole-cors --cors-configuration file://cors.json
```


