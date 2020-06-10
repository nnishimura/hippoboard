# Ansible playbook for go API server

URL：http://api.hippoboard.work/ping

## Provisioning

### Prep
* Update private key path in `hosts` file
* Add user
  * `aws_access_key`/`aws_secret_key`

```
ansible-vault create ./group_vars/web/pass.yml
```

### Run playbook

```
ansible-playbook -i hosts playbook.yml --ask-vault-pass
```
