#!/bin/bash

DB_FILE="/path/to/packets.db"
DOCKER_CONTAINER_NAME="meshview"

# backup database
cp $DB_FILE $DB_FILE.bkp

# Stop meshview container
echo "Stopping meshview container..."
docker stop $DOCKER_CONTAINER_NAME

sleep 5
echo "Run cleanup..."
# Run cleanup queries
sqlite3 "$DB_FILE" <<EOF 
DELETE FROM packet WHERE import_time < datetime('now', '-14 day');
DELETE FROM packet_seen WHERE import_time < datetime('now', '-14 day');
DELETE FROM traceroute WHERE import_time < datetime('now', '-14 day');
DELETE FROM node WHERE last_update < datetime('now', '-14 day') OR last_update IS NULL OR last_update = '';
VACUUM;
EOF

# Start meshview container
echo "Starting meshview container..."
docker start $DOCKER_CONTAINER_NAME

echo "Database cleanup completed on $(date)"