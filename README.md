# Ubuntu Workstation Salt State

Just a salt state for my Ubuntu Workstation. It just installs packages and stuff that I like to have available to develop with.

## Usage
From a fresh install I run

`sudo apt update && sudo apt install salt-minion`

I clone this repo and symlink `/srv/salt` to it.
For example:

`# ln -s /home/phillip/ubuntu_workstation_salt /srv/salt`

And finally call the high state to apply all the state files.

`# salt-call --local state.highstate`

You will probably want to modify these states heavily because it assumes the user's name is phillip and installs a bunch of stuff you probably won't want. You can cut what states get installed by removing their entries from the list in `top.sls`.

