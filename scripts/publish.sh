#!/usr/bin/env bash

# exit when any command fails
set -e

versionType="revision"
owner="ons"
github_tag="n/a"
#url="https://api.algpoc.com/v1/algorithms" #ons
url="https://api.algorithmia.com/v1/algorithms" #public

while getopts "a:k:g:t:v:o:u:" option; do
    case "${option}" in
    a) algorithm=${OPTARG};;
    k) authKey=${OPTARG};;
    g) github_repo=${OPTARG};;
    t) github_tag=${OPTARG};;
    v) versionType=${OPTARG};;
    o) owner=${OPTARG};;
    u) url=${OPTARG};;
    *) echo "script usage: $(basename $0) [-a algorithm] [-k auth key] [-v version (major, minor, revision)] [-o owner] [-u Algorithmia management api url]" >&2
       exit 1;;
    esac
done

echo "Publishing ${versionType} version of algorithm '${algorithm}'..."
echo

curl -X POST "${url}/${owner}/${algorithm}/versions" \
  -H "Authorization: Simple ${authKey}" \
  -H "Content-Type: application/json" \
  --data '{4
    "version_info": {
        "version_type": "'${versionType}'",
        "release_notes": "See GitHub https://github.com/'${github_repo}'/releases/tag/'${github_tag}'"
        }
    }'

echo
echo
