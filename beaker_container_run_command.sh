docker run --rm \
    --name beaker_container \
    --mount type=bind,source="$(pwd)",target=/module \
    --mount type=bind,source=~/.fog,target=/root/.fog \
    --mount type=bind,source=~/.ssh/id_rsa-acceptance,target=/root/.ssh/id_rsa-acceptance \
    --env BEAKER_setfile=/module/spec/acceptance/nodesets/temp.yaml \
    --env BEAKER_keyfile=/root/.ssh/id_rsa-acceptance \
    --env 'BEAKER_password=Qu@lity!' \
    --env BEAKER_debug=true \
    --env BEAKER_PE_DIR=http://enterprise.delivery.puppetlabs.net/2018.1/ci-ready \
    --env PUPPET_INSTALL_TYPE=agent \
    --env BEAKER_PUPPET_COLLECTION=puppet6 \
    --env BEAKER_TESTMODE=apply \
    --env BUNDLE_PATH=/module/.bundle/gems \
    beaker_alpine:latest
