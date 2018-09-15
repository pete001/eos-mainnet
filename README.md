# Ansible: EOS Mainnet

This simple Ansible repo will deploy an RPC API node hooked into the EOS mainnet.

It is intended to be used as the companion repo for the [EOS Node Tools](https://eosnode.tools/) microsite.

## Installing Ansible

Check the [official docs](http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine) for installing on the control machine.

## Configuration

- Update `inventory` with your server IP

- Update the environment vars in `group_vars/mainnet.yml` for your own settings

### SSH

When you first attempt to run an ansible playbook, it needs to be able to SSH to the target machine in the same way that you would manually SSH via the command line.

Set up key based authentication for SSH, and update the `ansible_user` variable in `group_vars/mainnet.yml` with that user.

## Running

### Installing EOS

To install EOS run:

```
ansible-playbook eos.yml
```

### Cofiguring EOS

To setup EOS for first time, run:

```
ansible-playbook mainnet.yml
```

### Updating the config

You can roll new changes to the `config.ini` with:

```
ansible-playbook mainnet.yml --tags=config
```