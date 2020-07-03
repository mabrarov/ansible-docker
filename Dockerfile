#
# Copyright (c) 2017 Marat Abrarov (abrarov@gmail.com)
#
# Distributed under Apache License, Version 2.0. (See accompanying
# file LICENSE or copy at http://www.apache.org/licenses/LICENSE-2.0)
#

# Based on https://github.com/William-Yeh/docker-ansible
# (https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile)

FROM alpine:3.12.0

RUN apk --no-cache add python3 py3-pip openssl ca-certificates perl \
        sshpass openssh-client rsync unzip tar && \
    apk --no-cache add --virtual build-dependencies \
        python3-dev libffi-dev openssl-dev build-base git && \
    pip install --upgrade pip cffi && \
    pip install ansible && \
    pip install --upgrade pywinrm && \
    git clone --depth=1 "https://github.com/jasonm23/cowsay.git" && \
    cd "cowsay" && \
    "./install.sh" "/usr/local" && \
    cd .. && \
    rm -rf "cowsay" && \
    apk del build-dependencies && \
    mkdir -p "/etc/ansible" && \
    echo 'localhost' > "/etc/ansible/hosts"

ENV ANSIBLE_NOCOWS=1

CMD [ "ansible-playbook", "--version" ]

LABEL name="abrarov/ansible" \
    version="1.2.0" \
    description="Ansible"
