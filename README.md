# Git Credential Manager Installer
This repo contains a bootstrap script and process for installing git-credential-manager that enables it to use gnome keyring from a non-gui login.  This is designed/configured to use OAuth for Azure DevOps repos and configure MSAL to use secure storage in gnome-keyring for MSAL's OAuth refresh tokens.

## Installation
1. Use the (mostly) automated setup for git-credential-manager (also installs azcli, but you don't need to use it)
    1. Run `wget https://aka.ms/gcmboot -N`
        * Downloads the bootstrap gist for neel-m.gcm (which will install git-credential-manager and azcli plus dependencies)
    1. Run `source gcmboot`
        * Runs the Ansible playbook to install GCM and azcli and helpers
    1. Run `gpg --quick-generate-key gcm`
        * This will initialize gpg and generate a key for use with gcm.  It will prompt you for a password/phrase/pin, must be at least 8 characters.
    1. Run `pass init gcm`
        * This will initialize pass (password utility) to use the new gpg key you created to securely store passwords

## Usage
Every time you start a new shell, you will need to use `startdbus` and `unlock` to get access to git repos.

If you forget, git operations will hang.  You can ctrl-c and then use the commands to get back to working