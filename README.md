#MOJ - Legal Aid Agency

## Requirements
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## How to install
* Copy `.env.example` to `.env`
* Generate all keys required in the `.env` file by visiting [here](https://roots.io/salts.html) 
* Run `vagrant up`
* Add `192.168.33.21    app.dev` to your `/etc/hosts` file

## How to access
* WP URL - http://app.dev
* WP Admin URL - http://app.dev/wp/wp-admin