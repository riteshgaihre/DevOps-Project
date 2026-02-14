#!/bin/bash

#Author - Ritesh
#Date - Thu 18 Dec 2025
#Script - This script output the aws resource usage
#version 2.0.0

set -e # exit the script when there is an error
set -o pipefail

echo "Print the ec2 instance id and image id"
aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | "\(.InstanceId) \(.ImageId)"'

echo "list s3 buckets"
aws s3 ls

echo "list lambda function"
aws lambda list-functions

echo "Print the IAM users"
aws iam list-users
