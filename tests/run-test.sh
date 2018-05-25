#!/usr/bin/env bash

#ansible-playbook --verbose --inventory-file inventory --user vagrant --ask-pass --become-user root --ask-become-pass test.yml

rm -rf /tmp/roles
mkdir /tmp/roles
cp -R ~/GitHub/ansible-role-base /tmp/roles/kurron.base
cp -R ~/GitHub/ansible-role-node-js /tmp/roles/kurron.node-js

packer validate packer.json
packer build --force packer.json


# Need to give the container access to your windowing system
export DISPLAY=:0
xhost +

CMD="docker run --env DISPLAY=unix${DISPLAY} \
                --env HOME=${HOME_DIR} \
                --env JDK_HOME=/usr/lib/jvm/azul-jdk-8 \
                --env JAVA_HOME=/usr/lib/jvm/azul-jdk-8 \
                --net host \
                --interactive \
                --tty \
                --rm \
                --workdir /usr/lib/jvm \
                kurron/ansible-role-node-js:latest bash"
echo $CMD
$CMD
