#!/bin/bash
set -e

ENV=$1
PROFILE=$2

aws cloudformation update-stack \
    --stack-name ${ENV}-cfn-demo-stack \
    --template-body file://template.yaml \
    --parameters \
      ParameterKey=Env,ParameterValue=${ENV} \
      ParameterKey=FunctionName,ParameterValue=CfnDemo \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile ${PROFILE}

sleep 20

aws cloudformation create-stack \
    --stack-name ${ENV}-cfn-demo-stack-2 \
    --template-body file://template-2.yaml \
    --parameters \
      ParameterKey=Env,ParameterValue=${ENV} \
      ParameterKey=FunctionName,ParameterValue=CfnDemoTwo \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile ${PROFILE}
