#!/bin/bash

if [[ ${1} ]]; then
   CLNAME=${1}
   cp ~/tmp/$CLNAME.crt ~/client-configs/keys/
   if [ $? -eq 0 ]; then
      echo "File $CLNAME.crt successfully copied"
      rm ~/tmp/*
   else
      echo "File $CLNAME.crt failed to copy"
   fi
   cd ~/client-configs/
   echo "Теперь запустите скрипт '~/client-configs/make_config.sh $CLNAME'"
   echo "Файл конфигурации будет создан здесь '~/client-configs/files/$CLNAME.ovpn'"
   ./make_config.sh $CLNAME
   ls ~/client-configs/files/$CLNAME.ovpn
else
   echo "Не задано имя клиента"
fi

