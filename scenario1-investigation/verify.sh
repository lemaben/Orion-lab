#!/bin/bash

base64 -d /opt/orion-system/backup/tracking.key | grep -q "flag{orion}" || exit 1

exit 0