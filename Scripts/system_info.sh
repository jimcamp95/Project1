#!/bin/bash

# Prints the amount of free memory on the system

free | grep Mem | awk '{print $4}' >> ~/backups/freemem/free_mem.txt

# Prints disk usage

du -ch | grep -i total >> ~/backups/diskuse/disk_usage.txt

# Lists all open files

ps aux >> ~/backups/openlist/open_list.txt

# Prints file system disk space statistics

df -h >> ~/backups/freedisk/free_disk.txt
