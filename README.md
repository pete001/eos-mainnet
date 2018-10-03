# Ansible: EOS Mainnet

This simple Ansible repo will deploy an RPC API node hooked into the EOS mainnet.

It is intended to be used as the companion repo for the [EOS Node Tools](https://eosnode.tools/) microsite.

## Installing Ansible

Check the [official docs](http://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-the-control-machine) for installing on the control machine.

### Existing Ansible Version

Please make sure you have the most recent version of Ansible installed as this repo utilises some of the newer syntax found in later versions. 

## Configuration

- Update `inventory` with your server IP

- Update the environment vars in `group_vars/mainnet.yml` for your own settings

- To upgrade EOS, update the `version` var in `group_vars/mainnet.yml`

## SSH

When you first attempt to run an ansible playbook, it needs to be able to SSH to the target machine in the same way that you would manually SSH via the command line.

Set up key based authentication for SSH, and update the `ansible_user` variable in `group_vars/mainnet.yml` with that user.

## One liner

You can run a single command to:

- Clone latest EOS repo
- Install mainnet configuration
- Download latest mainnet blocks backup from eosnode.tools
- Kick of a resync with the network

Just update the `inventory` with your node's IP, ensure you can access via ssh using key based auth, and run: 

```
ansible-playbook install.yml
```

Note: this will take some time! Once complete, you can follow progress on the node by tailing the `log.txt` in the `/opt/mainnet` directory (default location).

## Running

If you don't want to use the one liner, there are 3 playbooks that manage each stage. 

### Installing EOS

To install or upgrade EOS run:

```
ansible-playbook eos.yml
```

### Configuring EOS

To setup EOS for first time, run:

```
ansible-playbook mainnet.yml
```

### Updating the config

You can roll new changes to the `config.ini` with:

```
ansible-playbook mainnet.yml --tags=config
```

There are a few simple helpers to restart/stop the `nodeos` process:

### (Re)start

```
ansible-playbook management.yml -e "job=restart"
```

### Stop

```
ansible-playbook management.yml -e "job=stop"
```

### Replay

Warning! This will auto remove your `blocks` and `state` directories. It will take a long time to download and uncompress the blocks backup, consider using `-v` verbose modes to follow progress.

```
ansible-playbook management.yml -e "job=replay"
```
