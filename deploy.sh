#!/bin/bash

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
