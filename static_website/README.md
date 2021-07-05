# Static Website
***
## Manually deploy a static website into an S3 bucket and using static website hosting
***
In this project, we will deploy a static website to AWS. We will do this by uploading our website files into an S3 bucket,
configure that S3 bucket for static website hosting, and then set up a CloudFront distribution network.

The S3 endpoint for accessing the website was:

http://udacity-cloud-developer-static-website-2021.s3-website-us-west-2.amazonaws.com/index.html

The cloudfront endpoint for accessing the website was:

http://d3d2xeqvfzzyvn.cloudfront.net/index.html

### Files Included:
* `bucket_in_aws_account.png` - The created S3 bucket to hold the website
* `uploaded_files.png` - The website files uploaded into the newly created S3 bucket
* `static_website_hosting.png` - The S3 bucket is configured for static website hosting
* `public_bucket_policy.png` - The S3 bucket is configured to be publicly available
* `cloudfront_configured.png` - CloudFront is configured to retrieve and distribute website files
* `website_accessible_by_cloudfront_url.png` - We access our website via the CloudFront CDN
* `website_not_accessible_by_s3_endpoint.png` - Trying to access our website directly from S3 fails