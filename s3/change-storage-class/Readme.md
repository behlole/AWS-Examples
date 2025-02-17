## Create a bucket
```shell
aws s3 mb s3://behlole-change-storage-class
```
```shell
echo "Hello World" >> hello.txt
aws s3 cp hello.txt s3://behlole-change-storage-class/hello.txt --storage-class=STANDARD_IA
```
