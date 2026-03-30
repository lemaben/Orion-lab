#!/bin/bash
set -e

mkdir -p /opt/orion-system/backup
mkdir -p /opt/orion-system/reports

cat > /opt/orion-system/notes.txt <<'EOF'
Orion Logistics - Operations Note

Tracking service stopped responding early this morning.
Preliminary review suggests that unauthorized changes may have occurred overnight.

Tasks:
1. Review the system log for errors.
2. Verify that the tracking key file is present.
3. Determine what is preventing the service from starting normally.

- Operations Team
EOF

cat > /opt/orion-system/README_STUDENT.txt <<'EOF'
Welcome to the Orion Logistics incident lab.

Your objectives in this phase:
- Explore the application directory
- Read the operations note
- Analyze the system log
- Identify the root cause of the service failure
- Locate the missing key file
- Decode the recovery value

Important path:
/opt/orion-system
EOF

cat > /opt/orion-system/.ghost_note <<'EOF'
The key was not destroyed.
Look where old copies are kept.
EOF

echo "ZmxhZ3tvcmlvbl9yZWNvdmVyeV9jb2RlfQ==" > /opt/orion-system/backup/tracking.key

LOGFILE="/opt/orion-system/system.log"
> "$LOGFILE"

for i in $(seq 1 220); do
  printf "2026-03-29 08:%02d:%02d INFO Routine shipment sync completed successfully\n" $((i % 60)) $(((i * 3) % 60)) >> "$LOGFILE"
done

cat >> "$LOGFILE" <<'EOF'
2026-03-29 09:10:22 INFO Orion Tracking Service started initialization
2026-03-29 09:10:23 WARNING cache warmup delayed
2026-03-29 09:10:24 ERROR tracking.key file not found
2026-03-29 09:10:24 ERROR service initialization failed
2026-03-29 09:10:25 INFO retry scheduled
2026-03-29 09:10:40 WARNING dependency check incomplete
2026-03-29 09:10:55 ERROR tracking.key file not found
2026-03-29 09:10:55 ERROR service initialization failed
EOF

for i in $(seq 1 120); do
  printf "2026-03-29 09:%02d:%02d INFO Background log rotation checkpoint passed\n" $(((i + 11) % 60)) $(((i * 5) % 60)) >> "$LOGFILE"
done

chmod 755 /opt/orion-system
chmod 755 /opt/orion-system/backup
chmod 755 /opt/orion-system/reports
chmod 644 /opt/orion-system/notes.txt
chmod 644 /opt/orion-system/README_STUDENT.txt
chmod 644 /opt/orion-system/system.log
chmod 644 /opt/orion-system/backup/tracking.key
chmod 644 /opt/orion-system/.ghost_note

touch /tmp/orion-investigation-ready