Ubuntu Ansible
==============

|TravisCI|

Configure a Ubuntu machine using my personal preferences and usual tools and applications installed.
After installing a fresh Ubuntu installation all you need to do is install ansible:

::

    sudo apt-get install python-pip
    sudo pip install ansible

Once thats done then run one of the playbooks found in this repo.

``setup_gnome.yml`` is used for setting up a Ubuntu Gnome environment using Gnome Shell.

For example, setting up a machine with Ubuntu Gnome would be done as follows:

::

    ansible-playbook setup_gnome.yml -i local.inventory --ask-sudo-pass

This will prompt you for your user password, your Git username, your Git email address (this is to set up your git configuration correctly) and finally your gpg key id.

The user you run this as must have sudo priveleges for this playook to run successfully due to installing system wide applications.

This repo is currently designed so that core UNIX tools like curl and git which are purely terminal based and not dependent on any desktop environment are separated from UI based applications. Currently it is organised using roles as follows:

- Ubuntu: core Ubuntu Linux tools
- Developer: developer specific packages
- Gnome: Gnome core-related settings and applications
- Gnomeshell: Gnome shell specific configurations.

Further desktop environment roles may be added in the future (e.g. gnome, kde etc...)

The playbooks provided in this repo are currently being tested on a Ubuntu Gnome 16.04 machine

Also, check out my `Tumbleweed Ansible <http://github.com/michaelaquilina/tumbleweed-ansible>`__ repo which currently maintains
the state of my OpenSUSE Tumbleweed machine. I believe this is better structured than this repo due to being able to apply
learnings from this repo from the ground up...

.. |TravisCI| image:: https://travis-ci.org/MichaelAquilina/ubuntu-ansible.svg?branch=master
   :target: https://travis-ci.org/MichaelAquilina/ubuntu-ansible
