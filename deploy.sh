#!/bin/bash

aws cloudformation create-stack \
    --stack-name cfn-demo-stack \
    --template-body file://template.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --profile health
