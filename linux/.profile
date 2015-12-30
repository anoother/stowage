# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# PATH stuff for CUDA
PATH=/usr/local/cuda/bin:$PATH
LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

EDITOR=`which vim`

virtualenvwrapper=$(which virtualenvwrapper.sh || ls /usr/share/virtualenvwrapper/virtualenvwrapper.sh 2>/dev/null)
if [ $? -eq 0 ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    . ${virtualenvwrapper}
fi

export ANSIBLE_INVENTORY=~/ansible/hosts
