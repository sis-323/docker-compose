#!/bin/bash

echo "Se requiere su contraseña para modificar unos archivos del sistema"
sudo echo "127.0.0.1       minio" >> /etc/hosts

git clone https://github.com/sis-323/docker-compose.git docker-compose-ucbdegree
cd docker-compose-ucbdegree
docker-compose up -d
