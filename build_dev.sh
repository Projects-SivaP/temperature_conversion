#!/bin/bash

cd terraform/environment/non-prod
terraform init
teraform validate
if [ $? -eq 0 ]
    then 
    { 
        terraform apply -auto-approve
    }
else
    {
        echo "Check Terraform Configuration"
        exit 1
    }
fi