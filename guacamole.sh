#!/bin/sh
#
# check if docker is running
if ! (docker ps >/dev/null 2>&1)
then
        echo "docker daemon not running, will exit here!"
        exit
fi
echo "Criação da pastas necessárias ./init/initdb.sql"
mkdir ./init >/dev/null 2>&1
mkdir ./record >/dev/null 2>&1
echo "done"

echo "Permissões necessárias"
chmod -R +x ./init
chown -R 0:1001 ./record
chmod -R 2750 ./record
echo "done"

echo "Preparação da base de dados"
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > ./init/initdb.sql
echo "done
