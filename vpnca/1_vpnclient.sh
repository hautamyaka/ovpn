#!/bin/bash

if [[ ${1} ]]; then
   CLNAME=${1}
   cd ~/easy-rsa
   ./easyrsa import-req ~/tmp/$CLNAME.req $CLNAME
   ./easyrsa sign-req client $CLNAME
   cp ~/easy-rsa/pki/issued/$CLNAME.crt ~/tmp/
   echo "Теперь переместите файл '~/tmp/$CLNAME.crt' обратно на сервер VPN"
   scp ~/tmp/$CLNAME.crt vpn:./tmp/
   if [ $? -eq 0 ]; then
      echo "File $CLNAME.crt successfully copied"
      rm ~/tmp/*
   else
      echo "File $CLNAME.crt failed to copy"
   fi
else
   echo "Не задано имя клиента"
fi
