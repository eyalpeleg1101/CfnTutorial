#!/bin/bash
set -e

aws cloudformation update-stack \
    --stack-name cfn-demo-stack \
    --template-body file://template.yaml \
    --parameters ParameterKey=Env,ParameterValue=foo ParameterKey=FunctionName,ParameterValue=CfnDemo \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $1

aws cloudformation create-stack \
    --stack-name cfn-demo-stack-2 \
    --template-body file://template-2.yaml \
    --parameters ParameterKey=Env,ParameterValue=foo ParameterKey=FunctionName,ParameterValue=CfnDemoTwo \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $1