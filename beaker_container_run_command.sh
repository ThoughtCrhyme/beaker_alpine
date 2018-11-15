docker run -it --rm \
    --name beaker_container \
    --mount type=bind,source="$(pwd)"/spec,target=/spec \
    --mount type=bind,source="$(pwd)"/.bundle,target=/.bundle \
    --mount type=bind,source="$(pwd)"/Rakefile,target=/Rakefile \
    --env BEAKER_setfile=/spec/acceptance/nodesets/temp.yaml \
    --env BEAKER_keyfile=~/.ssh/authorized_keys \
    --env BEAKER_debug=true \
    --env BEAKER_PE_DIR=http://enterprise.delivery.puppetlabs.net/2018.1/ci-ready \
    --env PUPPET_INSTALL_TYPE=agent \
    --env BEAKER_PUPPET_COLLECTION=puppet6 \
    --env BEAKER_TESTMODE=apply \
    --env BUNDLE_PATH=/.bundle/gems \
    beaker_alpine:latest
