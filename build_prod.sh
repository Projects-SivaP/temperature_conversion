#!/bin/bash

cd terraform/environments/prod
terraform init
terraform validate
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