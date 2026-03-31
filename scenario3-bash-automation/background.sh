#!/bin/bash
set -e

mkdir -p /opt/orion-system
mkdir -p /opt/orion-system/scripts
mkdir -p /opt/orion-system/reports

cat > /opt/orion-system/README_BASH.txt <<'EOF'
Phase 3 - Automatisation Bash

Objectif :
Créer un script Bash simple pour automatiser l'analyse des logs.

Le script attendu devra :
- afficher un message de début
- rechercher les erreurs dans system.log
- rechercher les warnings dans system.log
- afficher un message de fin

Nom du script attendu :
/opt/orion-system/scan_logs.sh
EOF

cat > /opt/orion-system/system.log <<'EOF'
2026-03-29 09:10:22 INFO Orion Tracking Service started initialization
2026-03-29 09:10:23 WARNING cache warmup delayed
2026-03-29 09:10:24 ERROR tracking.key file not found
2026-03-29 09:10:24 ERROR service initialization failed
2026-03-29 09:10:25 INFO retry scheduled
2026-03-29 09:10:40 WARNING dependency check incomplete
2026-03-29 09:10:55 ERROR tracking.key file not found
2026-03-29 09:10:55 ERROR service initialization failed
2026-03-29 09:11:10 INFO service stopped
EOF

cat > /opt/orion-system/status_note.txt <<'EOF'
Le système a déjà été restauré et sécurisé.
L'objectif maintenant est d'automatiser certaines vérifications.
EOF

cat > /opt/orion-system/example_command.txt <<'EOF'
Exemple utile :
grep -i error /opt/orion-system/system.log
EOF

chmod 755 /opt/orion-system
chmod 755 /opt/orion-system/scripts
chmod 755 /opt/orion-system/reports
chmod 644 /opt/orion-system/README_BASH.txt
chmod 644 /opt/orion-system/system.log
chmod 644 /opt/orion-system/status_note.txt
chmod 644 /opt/orion-system/example_command.txt

touch /tmp/orion-bash-ready