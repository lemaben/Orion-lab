---

# ⚙️ background.sh (simplifié propre)

#!/bin/bash
set -e

mkdir -p /opt/orion-system/backup

cat > /opt/orion-system/notes.txt <<EOF
Service en panne.
Vérifier logs et présence du fichier tracking.key.
EOF

echo "ZmxhZ3tvcmlvbn0=" > /opt/orion-system/backup/tracking.key

cat > /opt/orion-system/system.log <<EOF
INFO start service
WARNING cache issue
ERROR tracking.key file not found
ERROR service failed
EOF

cat > /opt/orion-system/.ghost_note <<EOF
Nothing is ever truly lost.
EOF

touch /tmp/orion-investigation-ready