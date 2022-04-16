#!/bin/bash

echo "sudo tail -n 15000 /var/log/openvpn/openvpn.log | grep "MULTI: primary virtual IP for" | ccze -A"
sudo tail -n 15000 /var/log/openvpn/openvpn.log | grep "MULTI: primary virtual IP for" | ccze -A


