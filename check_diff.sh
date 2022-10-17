#!/bin/bash

# config
workdir=~/Documents/check-nas-backup
ssd=/Volumes/SAMSUNG_T5
hdd=/Volumes/HD-TDA-6T/backup-latest

# list ssd
cd $ssd
find . \( -name '.DS_Store' -or -name '._*' -or -name '.apdisk' -or -name 'Thumbs.db' -or -name 'Desktop.ini' \) -delete -print
find . -type d -name '.Spotlight-V100' -prune -o -type d -name '.Trashes' -prune -o -type d -name '.TemporaryItems' -prune -o -type f -print | sort > list_ssd.txt
mv list_ssd.txt $workdir

# list hdd
cd $hdd
find . \( -name '.DS_Store' -or -name '._*' -or -name '.apdisk' -or -name 'Thumbs.db' -or -name 'Desktop.ini' \) -delete -print
find . -type d -name '.Spotlight-V100' -prune -o -type d -name '.Trashes' -prune -o -type d -name '.TemporaryItems' -prune -o -type f -print | sort > list_hdd.txt
mv list_hdd.txt $workdir

# show diff
diff list_hdd.txt list_ssd.txt
