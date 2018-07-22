#!/bin/bash
set -e

BUCKET_NAME=aah-general

ENV=$1
PROFILE=$2

aws s3 cp \
    template-nested.yaml \
    "s3://${BUCKET_NAME}/" \
    --profile ${PROFILE}

aws cloudformation update-stack \
    --stack-name ${ENV}-cfn-demo-stack \
    --template-body file://template.yaml \
    --parameters \
      ParameterKey=Env,ParameterValue=${ENV} \
      ParameterKey=FunctionName,ParameterValue=CfnDemo \
      ParameterKey=BucketUrl,ParameterValue="https://s3.amazonaws.com/${BUCKET_NAME}/template-nested.yaml" \
      ParameterKey=Account,ParameterValue=preprod \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile ${PROFILE}
