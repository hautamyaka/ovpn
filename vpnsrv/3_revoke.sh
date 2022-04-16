#!/bin/bash

if [ -e $HOME/tmp/crl.pem ]
then
   echo "1. Копируем файл '~/tmp/crl.pem' в дирректорию '/etc/openvpn/server/'"
   sudo cp ~/tmp/crl.pem /etc/openvpn/server/
   echo "2. Перезапускаем сервис OpenVPN"
   sudo systemctl restart openvpn-server@server.service
else
   echo "Файл 'crl.pem' не найден..."
fi

