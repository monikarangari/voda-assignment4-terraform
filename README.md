**AWS/terraform  Assignment:**

-Create an S3 bucket using terraform and add a file in the S3 bucket
-The file in the S3 bucket should be accessible only from a certain IP address(example. Your machine IP)


**Solution:** 

1. Initialize Terraform:
    terraform init


2. Configuration

   Update the "variables.tf" file with the desired bucket name, file path, and allowed IP address and apply the Terraform code
   terraform apply

Once the configuration is applied successfully, we can access the uploaded file using the URL provided in the output.
