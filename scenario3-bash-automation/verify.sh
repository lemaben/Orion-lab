#!/bin/bash

SCRIPT="/opt/orion-system/scan_logs.sh"

[ -f "$SCRIPT" ] || exit 1
[ -x "$SCRIPT" ] || exit 1
head -n 1 "$SCRIPT" | grep -q '^#!/bin/bash' || exit 1
grep -qi 'error' "$SCRIPT" || exit 1
grep -qi 'warning' "$SCRIPT" || exit 1

exit 0