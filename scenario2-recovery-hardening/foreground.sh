#!/bin/bash
echo "Preparing Orion Logistics recovery environment..."

while [ ! -f /tmp/orion-recovery-ready ]; do
  sleep 1
done

echo "Environment ready."