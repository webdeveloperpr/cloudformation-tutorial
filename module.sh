# !/bin/bash

# Updates a cfn template.
function updateStack() {
    parameters = importParameters
    aws cloudformation deploy \
        --parameter-overrides Key1=Value1 Key2=Value2 \
        --template-file ./ec2.yaml \
        --stack-name simple-example \
        --s3-bucket cf-templates-g4ool1dn68hz-us-east-1 \
        --force-upload
}
