#!/bin/bash

branch_name=`git branch --show-current | tr '/' '-'`
git_branch_dev='development'

echo "In Branch $branch_name"

if [ $branch_name == "development" ]
then
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
elif [ $branch_name == "master" ]
then
    cd terraform/environment/prod
    terraform init
    teraform validate
    if [ $? -eq 0 ] ; then 
        { 
            terraform apply -auto-approve
        }
    else
        {
            echo "Check Terraform Configuration"
            exit 1
        }
    fi
else 
    echo "${branch_name} is not eligble for deployment"
fi