#!/bin/bash

ENV=$1
PROFILE=$2

aws cloudformation create-stack \
    --stack-name ${ENV}-cfn-demo-stack \
    --template-body file://template.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile ${PROFILE}
