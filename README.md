# Temperature Unit Conversion

##### URL's

	Git Repo 	-> https://github.com/Projects-SivaP/temperature_conversion
	Jekins Job 	-> http://34.234.62.23:8080/job/devops-challenge-multibranch/
        User - readonly, Password - abcd1234

#### CI/CD

##### Peer Code Review 
	Protected Branches - No Direct Push/Merge allowed and need atleast one approval (Approvals Can be Extended as required)
        Development - Intended for Non-Prod Regions like Dev and Test
        Master      - Intended for Prod Regions like Stage/Beta and Prod
    Integrated with LGTM.com

##### Seamless Application or Artifact Deployement
    Jenkins/GitHub Webhook  - http://34.234.62.23:8080/github-webhook/, establishes communication of Git Hub events to Jenkins
    Configured Jenkins Multibranch pipeline to listens to event and trigger pipeline based on Configured Jenkinsfile in repo
    Terraform State is stored in Centralized bucket for drift detection
    Terraform is modularized to be used across environments
    Terraform S3 Object Etag, will detect change in source python file and update it in source s3 bucket

##### Cloud Environment
    Provider - AWS
    Services
        EC2 for Jenkins Server
        S3 for holding python executable file
    
#### User Instructions

##### Pre-Requisite:
    Python Version 3 is installed on the client Machine
    Command to Verify - `python --version`
    If not installed, please refer
        - https://www.python.org/downloads/
        - https://realpython.com/installing-python/


##### Artifact Download:
    
*From browser* 
```
https://prod-devops-challenge.s3.amazonaws.com/src/temp_conv.py
```

or

*From command* 
```
curl https://prod-devops-challenge.s3.amazonaws.com/src/temp_conv.py -o temp_conv.py -s
```

###### Usage
```
python temp_conv.py
```

#### Priortized List of Enhancements
* Make GUI/Web Based Program so it is easy to use and OS agnostic 
* Enhance Security (Both Infrastructre and Code via sonar scans) and Stability (Like HA, Route 53 traffic routing)
* Implement Sonar Scans for PR's and Configure notifications for Jenkins Build Failures and Monitoring for AWS Infrastructure
* Extend Environments (Say Test, Stage/Beta) as application deemed necessary
* Make Terraform Modules for future Use to have consistent pattern usage acorss projects
  
> <font size="-2"> Note: As I am the only committer, merged my PR's with Admin Privileges <font size="+2">
