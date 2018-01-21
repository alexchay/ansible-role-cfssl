crgwilson.cfssl
=========

Ansible role which installs [the Cloudflare PKI tool set](https://github.com/cloudflare/cfssl). This includes all CLI tools, and, optionally, the CFSSL web API server. This can be done with or without an OCSP responder.

Requirements
------------

Any attempt to use this role will require a functional installation of [Go](https://golang.org) and this is NOT included.

Additionally, attempting to configure an OCSP responder will require a database schema [as described in the CFSSL documentation](https://github.com/cloudflare/cfssl/blob/master/certdb/README.md).

Role Variables
--------------

Coming soon...

Example Playbook
----------------

Base CLI install:
```yml
- hosts: my-hostname
  roles:
    - crgwilson.cfssl
```

Configure server as root CA with CFSSL WAPI:
```yml
- hosts: my-ca-hostname
  vars:
    - cfssl_configure_root_ca: true
    - cfssl_configure_ca: true
    - cfssl_configure_api_server: true
  roles:
    - crgwilson.cfssl
```

Configure server as root CA with CFSSL WAPI and OCSP responder WAPI:
```yml
- hosts: box
  remote_user: vagrant
  vars:
    - cfssl_configure_root_ca: true
    - cfssl_configure_ca: true
    - cfssl_configure_api_server: true
    - cfssl_configure_certdb: true
    - cfssl_configure_ocsp: true
  roles:
    - crgwilson.cfssl
```

License
-------

MIT

Disclaimer
------------------

This role is still a work in progress. There are likely all sorts of problems
with it at the moment so all configurations should be validated when put in use.
One issue I can think of off the top of my head is the inability to create a root and intermediate CA
on separate hosts...
