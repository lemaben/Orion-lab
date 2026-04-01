#!/bin/bash
echo "Préparation de l'environnement d'investigation Orion..."
while [ ! -f /tmp/orion-investigation-ready ]; do
  sleep 1
done
echo "Environnement prêt."