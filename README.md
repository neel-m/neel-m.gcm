# Git Credential Manager Installer
This repo contains a bootstrap script and process for installing git-credential-manager that enables it to use gnome keyring from a non-gui login.  This is designed/configured to use OAuth for Azure DevOps repos and configure MSAL to use secure storage in gnome-keyring for MSAL's OAuth refresh tokens.

## Installation
1. Use the (mostly) automated setup for git-credential-manager (also installs azcli, but you don't need to use it)
    1. Run `wget https://aka.ms/gcmboot -N`
        * Downloads the bootstrap gist for neel-m.gcm (which will install git-credential-manager and azcli plus dependencies)
    1. Run `source gcmboot`
        * Runs the Ansible playbook to install GCM and azcli and helpers
    1. Run `startdbus`
        * This helper runs dbus in a new shell (needed by gnome-keyring)
    1. Run `unlock`
        * Enter a password or pin (that you can remember)
        * This unlocks the keyring (the first password/key sets it for all future uses)

## Usage
Every time you start a new shell, you will need to use `startdbus` and `unlock` to get access to git repos.

If you forget, git operations will hang.  You can ctrl-c and then use the commands to get back to working