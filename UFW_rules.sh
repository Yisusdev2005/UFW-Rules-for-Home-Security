#!/bin/bash

#Script sencillo para mantener seguro tu equipo mietras navegas por la red usando el cortafuegos UFW

echo "Configurando UFW..."

sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "Desactivando conexión remota (SSH)..."

sudo ufw deny ssh

sudo ufw allow from 127.0.0.1
sudo ufw allow to 127.0.0.1

echo "Aplicando permisos a puertos comunes e importantes..."

sudo ufw allow out 53/tcp
sudo ufw allow out 53/udp
sudo ufw allow out 80/tcp
sudo ufw allow out 443/tcp
sudo ufw allow out 123/udp

echo "Rrestringiendo la conexion a puertos abiertos o peligrosos..."

sudo ufw deny 21/tcp
sudo ufw deny 23/tcp
sudo ufw deny 137:139/udp
sudo ufw deny 445/tcp

echo "Activando el cortafuegos..."

sudo ufw enable

echo "Estado de UFW: "
sudo ufw status verbose
