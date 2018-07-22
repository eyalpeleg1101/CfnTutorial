#!/bin/bash

aws cloudformation create-stack \
    --stack-name cfn-demo-stack \
    --template-body file://template.yaml \
    --parameters ParameterKey=Env,ParameterValue=foo \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $1
