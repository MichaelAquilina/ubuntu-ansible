# Ubuntu Ansible

Configure a Ubuntu machine using my personal preferences and usual tools and applications installed.
After installing a fresh Ubuntu installation all you need to do is install ansible:

    sudo apt-get install python-pip
    sudo pip install ansible

Once thats done then run one of the playbooks found in this repo. `setup_gnome.yml` is used for setting up a Ubuntu Gnome environment. `setup_unity.yml` is for setting up a standard run of the mill Ubuntu environment.

    ansible-playbook setup_gnome.yml -i local.inventory --ask-sudo-pass

This repo is currently designed so that core UNIX tools like curl and git which are purely terminal based and not dependent
on any desktop environment are separated from UI based applications. Currently it is organised using roles as follows:

  * Ubuntu: core ubuntu linux tools
  * Gnome: Gnome core-related settings and applications
  * Unity: Unity desktop environment settings and applications.
  * Gnomeshell: Gnome shell specific configurations.

Further desktop environment roles may be added in the future (e.g. gnome, kde etc...)

The playbooks provided in this repor were mainly tested on a Ubuntu 15.04 machine
