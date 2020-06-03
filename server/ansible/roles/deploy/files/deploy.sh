#!/bin/bash

cd /var/www/www.hippoboard.work && git -c core.sshCommand="ssh -i /root/.ssh/id_github_rsa" pull
