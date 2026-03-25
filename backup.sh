#!/bin/bash

BACKUP_DIR="/root/nginx-project/backups"
SOURCE_DIR="/root/nginx-project"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="nginx_backup_$DATE.tar.gz"
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SOURCE_DIR"
echo "Create backup: $BACKUP_DIR/$ARCHIVE_NAME"
