Role Name
=========

Install/ensure azcli for Debian machines.


Role Variables
--------------

`azcli_azure_package_name`: azure-cli

`azcli_repo_key_url`: https://packages.microsoft.com/keys/microsoft.asc

`azcli_apt_packages`:
  - aptitude
  - curl
  - apt-transport-https
  - gnupg

`azcli_update_apt_cache_for_azcli`: no


Example Playbook
----------------

```yaml
- hosts: servers
  roles:
      - { role: azcli, azcli_update_apt_cache_for_azcli: yes }
```

License
-------

MIT

