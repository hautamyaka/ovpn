#!/bin/bash

if [[ ${1} ]]; then
   CLNAME=${1}
   cd ~/easy-rsa
   ./easyrsa gen-req $CLNAME nopass
   cp pki/private/$CLNAME.key ~/client-configs/keys/
   cp ~/easy-rsa/pki/reqs/$CLNAME.req ~/tmp/
   cd ~/tmp
   ls -l
   echo "Теперь передайте файл '~/tmp/$CLNAME.req' на сервер ЦС, используя безопасный метод:"
   scp ~/tmp/$CLNAME.req caof:./tmp/
   if [ $? -eq 0 ]; then
      echo "File $CLNAME.req successfully copied"
   else
      echo "File $CLNAME.req failed to copy"
   fi
else
   echo "Не задано имя клиента"
fi
