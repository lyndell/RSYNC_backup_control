#!/bin/bash -x 
#
##############################################################################
#
# FILE:  rsync-backup.sh
# DESC:  Synchronizes one directory to a remote server over SSH 
#
# NAME:  Lyndell Rottmann
# EMAIL: Lyndell@Lyndell.US
#
#
#

# import settings
# TODO; test for parameter; required
# TODO; test for directories listed in DIR parms

set -u # exit over uninitialised variables

# logging and log naming.
LOGNUM=`date +%s`
LOGNAME='rebackup'
LOGDIR="./logs"
LOGEXT="log"
LOGFILE="${LOGDIR}/${LOGNAME}.${LOGNUM}.${LOGEXT}"

# Sources:
# ~/Exclude/BACKUP/2012\ Feast\ -\ Kauai\ Photographs

opts=""
opts="--exclude='.git'"
# -i, --itemize-changes       output a change-summary for all updates
#     --log-file=FILE         log what we're doing to the specified FILE
#     -v, --verbose               increase verbosity
#     -a, --archive               archive mode; same as -rlptgoD (no -H)
#     -r, --recursive             recurse into directories
#     -t, --times                 preserve times
#     --exclude=PATTERN       exclude files matching PATTERN

## MAXTOR drive
rsync $opts -i --log-file=$LOGFILE --delete -avv \
~/Excludes/BACKUP                                \
~/Excludes/cloud.Lyndell.NET                     \
/Volumes/Maxtor/BACKUP-RSYNC

exit;
~/Excludes/VIDEOS                                \
