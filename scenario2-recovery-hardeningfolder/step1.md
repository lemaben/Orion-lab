# Step 1: Recover and Secure the System

Start by checking the service status.

## Useful commands
```bash
cd /opt/orion-system
./service_status.sh
cp /opt/orion-system/backup/tracking.key /opt/orion-system/tracking.key
./service_status.sh
nano scan_logs.sh
chmod +x scan_logs.sh
./scan_logs.sh
chmod 600 /opt/orion-system/tracking.key
mv /opt/orion-system/.ghost_note /opt/orion-system/quarantine/
./service_status.sh