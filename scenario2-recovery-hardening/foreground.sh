#!/bin/bash
echo "Préparation de l'environnement de remédiation Orion..."
while [ ! -f /tmp/orion-recovery-ready ]; do
  sleep 1
done
echo "Environnement prêt."