# !/bin/bash

# Gets the instance ids
function getInstancesIds() {
    ids= aws ec2 describe-instances |
        jq 'getpath(["Reservations"])' |
        jq 'map(.Instances[].InstanceId)'

    echo $ids
}

function importParameters() {
    cat ./config.json |
        jq '.parameters' |
        jq 'reduce .[] as $item (""; . + $item.key + "=" + $item.value)'
}

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
