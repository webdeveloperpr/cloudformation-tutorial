# !/bin/bash

# Gets the instance ids
function getInstancesIds() {
    ids= aws ec2 describe-instances |
        jq 'getpath(["Reservations"])' |
        jq 'map(.Instances[].InstanceId)'

    echo $ids
}

# Updates a cfn template.
function updateStack() {
    aws cloudformation deploy \
        --template-file ./ec2.yaml \
        --stack-name simple-example \
        --s3-bucket cf-templates-g4ool1dn68hz-us-east-1 \
        --force-upload
}

updateStack
