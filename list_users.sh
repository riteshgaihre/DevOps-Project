#!/bin/bash

# Base URL for Github API
API_URL="https://api.github.com"


# Github credentials (username and token)
GITHUB_USERNAME=$username
GITHUB_TOKEN=$token


# Repository Owner and repository name passed as command line argument
REPO_OWNER=$1
REPO_NAME=$2


# Helper function to check if exactly 2 arguments are provided
function helper {
	counts=2
	if [[ $# -ne $counts ]]; then
		echo "Please provide 2 command line arguments"
		echo "Example: Users_list.sh Classroom Students"
		exit 1
	fi
}


# Function to call github API

function github_api {
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
	local url="${API_URL}/${endpoint}"

	curl -s -u "${GITHUB_USERNAME}:${GITHUB_TOKEN}" "$url"
}


# Function to list users who have read access to the repository 

function list_users_with_read_access { 
	collaborators="$(github_api | jq -r '.[] | select(.permissions.pull == true) | .login')"
	if [[ -z "$collaborators" ]]; then
		echo "Users with read access is not found"
	else
		echo "Users with read access found for ${REPO_OWNER}/${REPO_NAME}:"
		echo "$collaborators"
	fi
	}
helper "$@"
	
list_users_with_read_access


