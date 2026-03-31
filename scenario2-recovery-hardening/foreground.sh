#!/bin/bash
while [ ! -f /tmp/orion-recovery-ready ]; do
  sleep 1
done