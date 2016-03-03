# Local Dev Environment Setup

Personal Mac setup provisioned through Ansible

## Installation

Simply cloning this repository and running `make` is all that is required. Doing
so will install pip and Ansible as they are both required to provision.

The `mac-osx.yml` playbook is then ran to provision everything.

## Requirements

All requirements listed here are only for reference purposes. These will be
installed automatically on first run if they are missing.

* xcodetools
* Pip
* Ansible

## Available Tools

* Atom (http://atom.io)
* Browsers (Chrome and Firefox)
* Database tools (Sequel Pro and Robomongo)
* Docker Toolbox and Kitematic
* Dotfiles for BASH and GIT
* GIT and Github Desktop
* Node.js

### Docker Toolbox

This role will take the liberty of installing a few essential Docker tools such
as machine, compose and swarm. It will also set up a default `dev` machine using
VirtualBox to use where the swarm image will also be pulled.
