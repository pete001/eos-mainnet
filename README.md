# Ansible: EOS Mainnet

This simple Ansible repo will deploy an RPC API node hooked into the EOS mainnet.

It is intended to be used as the companion repo for the [EOS Node Tools]() microsite.

## Installing Ansible

Check the [official docs](http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine) for installing on the control machine.

## Configuration

- Update `inventory` with your server IP

- Update the environment vars in `group_vars/mainnet.yml` for your own settings

## Running

### Installing EOS

To install EOS run:

```
ansible-playbook mainnet.yml
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