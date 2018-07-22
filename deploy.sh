#!/bin/bash
set -e

BUCKET_NAME=aah-general

aws s3 cp \
    template-nested.yaml \
    "s3://${BUCKET_NAME}/" \
    --profile $1

aws cloudformation update-stack \
    --stack-name cfn-demo-stack \
    --template-body file://template.yaml \
    --parameters \
      ParameterKey=Env,ParameterValue=foo \
      ParameterKey=FunctionName,ParameterValue=CfnDemo \
      ParameterKey=BucketUrl,ParameterValue="https://s3.amazonaws.com/${BUCKET_NAME}/template-nested.yaml" \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $1
