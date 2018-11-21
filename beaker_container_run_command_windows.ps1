docker run --rm `
           --name beaker_container `
           --mount type=bind,source="$($pwd.path)",target=/module `
           --mount type=bind,source="$HOME/.fog",target=/root/.fog `
           --mount type=bind,source="$HOME/.ssh/id_rsa-acceptance",target=/root/.ssh/id_rsa-acceptance `
           --env BEAKER_setfile=/module/spec/acceptance/nodesets/temp.yaml `
           --env BEAKER_PE_DIR=http://enterprise.delivery.puppetlabs.net/2018.1/ci-ready `
           --env PUPPET_INSTALL_TYPE=agent `
           --env BEAKER_PUPPET_COLLECTION=puppet6 `
           --env BEAKER_TESTMODE=apply `
           beaker_alpine:latest