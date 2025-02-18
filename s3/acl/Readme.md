## Create a Bucket
```shell
aws s3 mb s3://behlole-acl
```
## Turn OFF Block Public Access for ACL
```shell
aws s3api put-public-access-block \
--bucket behlole-acl \
--public-access-block-configuration="BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

## Get Public Access
```shell
aws s3api get-public-access-block \
--bucket="behlole-acl"
```
## Change Bucket Ownership
```shell
aws s3api put-bucket-ownership-controls \
--bucket="behlole-acl" \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACL to allow for a user in other AWS Account
```shell
aws s3api put-bucket-acl \
--bucket="behlole-acl" \
--access-control-policy="file://policy.json"
```
