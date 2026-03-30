#!/bin/bash

grep -qi "tracking.key file not found" /opt/orion-system/system.log || exit 1
find /opt/orion-system -name "tracking.key" | grep -q "/opt/orion-system/backup/tracking.key" || exit 1
base64 -d /opt/orion-system/backup/tracking.key 2>/dev/null | grep -q "flag{orion_recovery_code}" || exit 1

exit 0