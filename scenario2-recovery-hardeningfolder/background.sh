#!/bin/bash
set -e

mkdir -p /opt/orion-system/backup
mkdir -p /opt/orion-system/scripts
mkdir -p /opt/orion-system/quarantine
mkdir -p /opt/orion-system/reports

cat > /opt/orion-system/notes.txt <<'EOF'
Orion Logistics - Recovery Note

The investigation team confirmed that the tracking service fails because
tracking.key is missing from its expected location.

The key has already been located elsewhere on the system.

Remaining tasks:
1. Restore service functionality.
2. Automate at least one investigation check.
3. Apply basic hardening before closing the incident.

- Operations Team
EOF

cat > /opt/orion-system/README_STUDENT.txt <<'EOF'
Welcome to the Orion Logistics recovery and hardening phase.

Your objectives:
- Restore tracking.key to the correct location
- Verify the service state
- Create a simple Bash script to check logs
- Protect the recovered key with better permissions
- Quarantine the suspicious hidden file
- Confirm the final secured state

Important path:
/opt/orion-system
EOF

cat > /opt/orion-system/.ghost_note <<'EOF'
This file should not remain in the active environment.
EOF

echo "ZmxhZ3tvcmlvbl9yZWNvdmVyeV9jb2RlfQ==" > /opt/orion-system/backup/tracking.key

LOGFILE="/opt/orion-system/system.log"
> "$LOGFILE"

for i in $(seq 1 150); do
  printf "2026-03-29 08:%02d:%02d INFO Routine shipment sync completed successfully\n" $((i % 60)) $(((i * 7) % 60)) >> "$LOGFILE"
done

cat >> "$LOGFILE" <<'EOF'
2026-03-29 09:10:22 INFO Orion Tracking Service started initialization
2026-03-29 09:10:23 WARNING cache warmup delayed
2026-03-29 09:10:24 ERROR tracking.key file not found
2026-03-29 09:10:24 ERROR service initialization failed
2026-03-29 09:10:25 INFO retry scheduled
EOF

cat > /opt/orion-system/service_status.sh <<'EOF'
#!/bin/bash

KEY="/opt/orion-system/tracking.key"
ARTIFACT="/opt/orion-system/.ghost_note"

if [ ! -f "$KEY" ]; then
  echo "SERVICE STATUS: OFFLINE"
  echo "ERROR: tracking.key missing from /opt/orion-system"
  exit 1
fi

PERM=$(stat -c "%a" "$KEY")

if [ "$PERM" != "600" ]; then
  echo "SERVICE STATUS: ONLINE"
  echo "Tracking key detected."
  echo "SECURITY STATUS: WARNING"
  echo "tracking.key permissions are $PERM, expected 600"
  if [ -f "$ARTIFACT" ]; then
    echo "Suspicious hidden artifact still present."
  fi
  exit 0
fi

if [ -f "$ARTIFACT" ]; then
  echo "SERVICE STATUS: ONLINE"
  echo "Tracking key detected."
  echo "SECURITY STATUS: PARTIAL"
  echo "tracking.key permissions are correct."
  echo "Suspicious hidden artifact still present."
  exit 0
fi

echo "SERVICE STATUS: ONLINE"
echo "Tracking key detected."
echo "SECURITY STATUS: HARDENED"
echo "FLAG: system_restored_and_secured"
EOF

chmod +x /opt/orion-system/service_status.sh

rm -f /opt/orion-system/tracking.key

chmod 755 /opt/orion-system
chmod 755 /opt/orion-system/backup
chmod 755 /opt/orion-system/scripts
chmod 755 /opt/orion-system/quarantine
chmod 755 /opt/orion-system/reports
chmod 644 /opt/orion-system/notes.txt
chmod 644 /opt/orion-system/README_STUDENT.txt
chmod 644 /opt/orion-system/system.log
chmod 644 /opt/orion-system/backup/tracking.key
chmod 644 /opt/orion-system/.ghost_note

touch /tmp/orion-recovery-ready