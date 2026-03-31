---

# ⚙️ background.sh

```bash
#!/bin/bash
set -e

mkdir -p /opt/orion-system/backup
mkdir -p /opt/orion-system/quarantine

echo "ZmxhZ3tzZWN1cmV9" > /opt/orion-system/backup/tracking.key

cat > /opt/orion-system/service_status.sh <<'EOF'
#!/bin/bash

if [ ! -f /opt/orion-system/tracking.key ]; then
  echo "SERVICE STATUS: OFFLINE"
  exit 1
fi

PERM=$(stat -c "%a" /opt/orion-system/tracking.key)

if [ "$PERM" != "600" ]; then
  echo "SERVICE STATUS: ONLINE"
  echo "SECURITY WARNING"
  exit 0
fi

if [ -f /opt/orion-system/.ghost_note ]; then
  echo "SERVICE STATUS: ONLINE"
  echo "SECURITY PARTIAL"
  exit 0
fi

echo "SERVICE STATUS: ONLINE"
echo "SECURITY HARDENED"
EOF

chmod +x /opt/orion-system/service_status.sh

cat > /opt/orion-system/.ghost_note <<EOF
Suspicious file
EOF

touch /tmp/orion-recovery-ready