#!/bin/bash
echo "Préparation..."
while [ ! -f /tmp/orion-bash-ready ]; do
  sleep 1
done
echo "Environnement prêt."