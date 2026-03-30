# Step 1: Investigate the System

Start by exploring the application directory.

## Useful commands
```bash
cd /opt/orion-system
ls
ls -a
cat notes.txt
less system.log
grep -i error system.log
grep -i failed system.log
find /opt/orion-system -name "tracking.key"
base64 -d /opt/orion-system/backup/tracking.key