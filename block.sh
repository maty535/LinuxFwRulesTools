#!/bin/bash

for i in `cat /root/fw/spammers_ips.txt |grep -v "#"`
do
ADDR=$i
/sbin/iptables -t filter -I INPUT -s $ADDR -j DROP
/sbin/iptables -t filter -I OUTPUT -s $ADDR -j DROP
/sbin/iptables -t filter -I FORWARD -s $ADDR -j DROP
/sbin/iptables -t filter -I INPUT -d $ADDR -j REJECT
/sbin/iptables -t filter -I OUTPUT -d $ADDR -j REJECT
/sbin/iptables -t filter -I FORWARD -d $ADDR -j REJECT
echo "Block ALL INPUT from " $ADDR " net DROPPED."
done

for i in `cat /root/fw/ssh-spammers.txt |grep -v "#"`
do
ADDR=$i
/sbin/iptables -t filter -I INPUT -s $ADDR -j DROP
/sbin/iptables -t filter -I OUTPUT -s $ADDR -j DROP
/sbin/iptables -t filter -I FORWARD -s $ADDR -j DROP
/sbin/iptables -t filter -I INPUT -d $ADDR -j REJECT
/sbin/iptables -t filter -I OUTPUT -d $ADDR -j REJECT
/sbin/iptables -t filter -I FORWARD -d $ADDR -j REJECT
echo "Block ALL INPUT from " $ADDR " net DROPPED."
done


