Role Name
=========

Install the Git Credential Manager (on Ubuntu) using dotnet

Requirements
------------

None

Role Variables
--------------

`dot_net_package_name`: dotnet-sdk-7.0

`repo_key_url`: https://packages.microsoft.com/keys/microsoft.asc

`apt_packages`:
  - apt-transport-https
  - curl
  - dbus-user-session
  - gnome-keyring
  - libsecret-tools

`update_apt_cache_for_dot_net`: `false`


Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: servers
  roles:
      - { role: gcm, update_apt_cache_for_dot_net: yes }
```

License
-------

MIT

Author Information
------------------

