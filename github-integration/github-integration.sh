#!/bin/bash

##################################
#
# Author: Lokesh
# Date: 25/02/2024
# 
# this script integrate the github with shell script
###################################



set -x # debug mode 
set -e 
set -o pipefail



# GET THE OWNERS REPO
echo "GET THE OWNERS REPO"
curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $token" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/users/$owner/repos | grep "name" >> REPOS

# GET THE BRANCHES OF THE SPECIFIC REPO
echo "GET THE BRANCHES OF THE SPECIFIC REPO"

curl -L \
  -X GET \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $token" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$owner/ClassVault/branches  >> BRANCHES


# GET THE COMMITS OF REPO
echo "GET THE COMMITS"

curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $token" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$owner/ClassVault/activity >> COMMITS

#classvault is my repo name change it to yours
