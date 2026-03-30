#!/bin/bash
echo "Preparing Orion Logistics investigation environment..."

while [ ! -f /tmp/orion-investigation-ready ]; do
  sleep 1
done

echo "Environment ready."