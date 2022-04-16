#!/bin/bash

if [[ ${1} ]];
then
   CLNAME=${1}
   cd ~/easy-rsa
   ./easyrsa revoke $CLNAME
   echo "Cгенерируем CRL или обновим существующий файл crl.pem"
   ./easyrsa gen-crl
   echo "Передайте файл 'crl.pem' из дирректории '~/tmp/' на сервер VPN"
   cp ~/easy-rsa/pki/crl.pem ~/tmp/
   ls -l ~/tmp/
else
   echo "Не задано имя клиента"
fi

