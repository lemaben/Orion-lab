#!/bin/bash
while [ ! -f /tmp/orion-investigation-ready ]; do
  sleep 1
done