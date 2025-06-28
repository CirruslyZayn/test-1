#!/usr/bin/env bash

# Check if bucket name is provided
if [ -z "$1" ]; then
    echo "There needs to be a bucket name."
    exit 1
fi

# Attempt to create the bucket
aws s3api create-bucket \
--bucket "$1" \
--region eu-west-1 \
--create-bucket-configuration LocationConstraint=eu-west-1

# Check result
if [ $? -eq 0 ]; then
    echo "Bucket $1 created successfully."
    exit 0
else
    echo "Failed to create bucket '$1'."
    exit 1
fi
