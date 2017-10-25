FROM ubuntu:xenial

# Required for non-interactive installation of gnome-shell
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python-pip gnome-shell && \
    pip install ansible

COPY . /home/ubuntu/ubuntu-ansible
WORKDIR /home/ubuntu/ubuntu-ansible

RUN ansible-playbook -i local.inventory setup_gnome.yml
