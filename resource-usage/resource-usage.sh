#!/bin/bash 

#######################
#
# Author: Lokesh
# Date: 24/02/2024
#
# Version: v1
#
# this script will report the aws  resource usage 
#######################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

set -x # debug mode 

# list s3 buckets
echo "list s3 buckets"
aws s3 ls > resourceTracker

#list ec2 instances
echo "list ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker   # parsing json and getting only id 

# list lambda functions
echo "list lambda functions"
aws lambda list-functions >> resourceTracker

# list IAM users
echo "list iam users"
aws iam list-users >> resourceTracker

#################
# Add the cron job
# https://phoenixnap.com/kb/cron-job-mac --> refrence
# write crontab -e 
# 10 9 * * * /Users/lokiislazy/Desktop/devops/resource-usage/resource-usage.sh
##################