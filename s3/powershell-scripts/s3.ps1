Import-Module AWS.Tools.S3

$region = "us-east-1"

$bucketName = Read-Host -Prompt  "Enter the S3 Bucket Name"
Write-Host "S3 Bucket : $bucketName"
Write-Host "Region Name : $region"


function BucketExists
{
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}
# Create a new file
if (-not (BucketExists))
{
    Write-Host "Bucket Does not Exists!"
    New-S3Bucket -BucketName $bucketName -Region $region
}
else
{
    Write-Host "Bucket Already Exists!"
}
$fileName = "myFile.txt"
$fileContent = "Hello World!"
Set-Content -Path $fileName -Value $fileContent


Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName
