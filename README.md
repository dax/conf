conf
====

conf is a small script to manager user configuration with Opscode Chef.

Installation
============

    curl https://raw.github.com/dax/conf/master/bootstrap.sh | sh

The script should have created a file `${HOME}/confrc` with 2 variables:

* `LOCAL_CONF_DIR`: is the directory where all conf modules will be installed
* `REMOTE_CONF`: is the base git url where conf modules can be found (eg. `git://github.com/dax` or `user@host:/path/to/modules`)

Modules
=======

A module must be a Git repository with a `conf/solo.rb` and `conf/solo.json` Chef Solo file (`conf` git repository is a `conf` module).

Usage
=====

The main commands are:

* `install`: will clone the Git module repository and apply the Chef configuration

    conf install dot-profile

* `update`: will update the module
* `list`: will list available conf modules (only works through a ssh connection, ie. not on Github)
* `status`: will list installed modules and their status (some modifications on installed files, some modification on local Git repository, ...).
* `apply`: will apply Chef module configuration
* `diff`: will list differences between installed files and the Chef configuration

TODO
====

* Make install work without REMOTE_CONF but with a full Git url
