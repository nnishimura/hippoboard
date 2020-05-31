#!/bin/bash

cd /var/www/static.nnishimura.work && git -c core.sshCommand="ssh -i /root/.ssh/id_github_rsa" pull
