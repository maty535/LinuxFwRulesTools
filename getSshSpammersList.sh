#!/bin/bash

grep -rhi 'refused' /var/log/auth.log | awk '{print substr($10,2,length($10)-2)}'| sort| uniq  > /root/fw/ssh-spammers.txt
