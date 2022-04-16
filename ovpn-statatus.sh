#!/bin/bash

#sudo tail -n 100000 /var/log/openvpn/openvpn.log | grep "MULTI: primary virtual IP for" | ccze -A

sudo tail -f /var/log/openvpn/openvpn-status.log | ccze -A


