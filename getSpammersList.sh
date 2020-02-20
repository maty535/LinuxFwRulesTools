#!/bin/bash

grep -rhi 'authentication failure;' /var/log/auth.log* | awk '{print substr($14,7)}'|uniq|sort|uniq > ./spammers_ips.txt

