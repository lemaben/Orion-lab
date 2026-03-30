#!/bin/bash

[ -f /opt/orion-system/tracking.key ] || exit 1
[ "$(stat -c "%a" /opt/orion-system/tracking.key)" = "600" ] || exit 1
[ ! -f /opt/orion-system/.ghost_note ] || exit 1
/opt/orion-system/service_status.sh | grep -q "FLAG: system_restored_and_secured" || exit 1

exit 0