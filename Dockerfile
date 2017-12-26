#
# Copyright (c) 2017 Marat Abrarov (abrarov@gmail.com)
#
# Distributed under Apache License, Version 2.0. (See accompanying
# file LICENSE or copy at http://www.apache.org/licenses/LICENSE-2.0)
#

# Based on https://github.com/William-Yeh/docker-ansible
# (https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile)

FROM alpine:3.7

LABEL name="abrarov/ansible" \
    version="1.0.0" \
    description="Ansible"

RUN apk --no-cache add python py-pip openssl ca-certificates &&\
    apk --no-cache add --virtual build-dependencies \
        python-dev libffi-dev openssl-dev build-base  &&\
    pip install --upgrade pip cffi &&\
    pip install ansible &&\
    pip install --upgrade pywinrm  &&\
    apk del build-dependencies &&\
    apk --no-cache add sshpass openssh-client rsync unzip tar &&\
    mkdir -p "/etc/ansible" &&\
    echo 'localhost' > "/etc/ansible/hosts"

WORKDIR "/etc/ansible"

CMD [ "ansible-playbook", "--version" ]
