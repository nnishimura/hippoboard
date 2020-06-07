#!/bin/bash

cd /var/www/api.hippoboard.work && git -c core.sshCommand="ssh -i /root/.ssh/id_github_rsa" pull
