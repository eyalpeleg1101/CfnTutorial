#!/bin/bash

aws cloudformation create-stack \
    --stack-name $1-cfn-demo-stack \
    --template-body file://template.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile $2
