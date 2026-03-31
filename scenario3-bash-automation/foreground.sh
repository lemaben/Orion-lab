#!/bin/bash
echo "Préparation de l'environnement Bash Orion..."

while [ ! -f /tmp/orion-bash-ready ]; do
  sleep 1
done

echo "Environnement prêt."