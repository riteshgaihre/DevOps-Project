#!/bin/bash

#Author - Ritesh
#Date - Thu 18 Dec 2025
#Script - This script output the aws resource usage

echo "Print the ec2 instance id"
aws ec2 describe-instances | jq -r '.Reservations[].Instances[].InstanceId'

echo "list s3 buckets"
aws s3 ls

echo "list lambda function"
aws lambda list-functions

echo "Print the IAM users"
aws iam list-users
