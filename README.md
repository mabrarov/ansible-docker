# Docker image with Ansible

[![License](https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg)](LICENSE)

Based on [williamyeh/ansible:alpine3](https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile)
Docker image from [William-Yeh/docker-ansible](https://github.com/William-Yeh/docker-ansible).

# Building

```bash
$ docker build -t abrarov/ansible .
```

# Testing

1. Ansible version:

   ```bash
   docker run --rm abrarov/ansible
   ```

   Expected output

   ```text
   ansible-playbook 2.9.10
     config file = None
     configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/lib/python3.8/site-packages/ansible
     executable location = /usr/bin/ansible-playbook
     python version = 3.8.3 (default, May 15 2020, 01:53:50) [GCC 9.3.0]
   ```

1. Ansible ping of localhost

   ```bash
   docker run --rm abrarov/ansible ansible -m ping localhost \
       -e ansible_connection=local \
       -e ansible_python_interpreter='{{ansible_playbook_python}}'
   ```

   Expected output

   ```text
   localhost | SUCCESS => {
       "changed": false,
       "ping": "pong"
   }
   ```

1. Cowsay

   ```bash
   docker run --rm abrarov/ansible cowsay test
   ```

   Expected output

   ```text
    ______
   < test >
    ------
           \   ^__^
            \  (oo)\_______
               (__)\       )\/\
                   ||----w |
                   ||     ||
   ```
