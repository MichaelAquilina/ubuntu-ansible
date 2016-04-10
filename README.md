# Ubuntu Ansible

Configure a Ubuntu machine using my personal preferences and usual tools and applications installed.
After installing a fresh Ubuntu installation all you need to do is install ansible:

    sudo apt-get install python-pip
    sudo pip install ansible

NOTE: The playbooks in this repo currently only work with ansible 1.9.4. Install using `pip install ansible==1.9.4`

Once thats done then run one of the playbooks found in this repo.

`setup_gnome.yml` is used for setting up a Ubuntu Gnome environment using Gnome Shell.
`setup_unity.yml` is for setting up a standard run of the mill Ubuntu environment using Unity.

For example, setting up a machine with Ubuntu Gnome would be done as follows:

    ansible-playbook setup_gnome.yml -i local.inventory --ask-sudo-pass

This will prompt you for your user password, your Git username and your Git email address (this is to set up your git configuration correctly). The user you run this as must have sudo priveleges for this playook to run successfully due to installing system wide applications.

This repo is currently designed so that core UNIX tools like curl and git which are purely terminal based and not dependent on any desktop environment are separated from UI based applications. Currently it is organised using roles as follows:

  * Ubuntu: core Ubuntu Linux tools
  * Gnome: Gnome core-related settings and applications
  * Unity: Unity desktop environment settings and applications.
  * Gnomeshell: Gnome shell specific configurations.

Further desktop environment roles may be added in the future (e.g. gnome, kde etc...)

The playbooks provided in this repo are currently being tested on a Ubuntu Gnome 15.10 machine
