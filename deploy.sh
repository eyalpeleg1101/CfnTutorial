#!/bin/bash

aws cloudformation update-stack \
    --stack-name cfn-demo-stack \
    --template-body file://template.yaml \
    --parameters ParameterKey=Env,ParameterValue=foo ParameterKey=FunctionName,ParameterValue=CfnDemo \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $1
