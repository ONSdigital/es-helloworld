#!/usr/bin/env bash

# exit when any command fails
set -e

versionType="revision"
owner="ons"
url="https://api.algpoc.com/v1/algorithms"

while getopts "a:k:v:o:u:" option; do
    case "${option}" in
    a) algorithm=${OPTARG};;
    k) authKey=${OPTARG};;
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
  --data '{
    "version_info": {
        "version_type": "'${versionType}'"
        }
    }'

echo
echo
