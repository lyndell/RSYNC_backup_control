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

# logging and log naming.
LOGNUM=`date +%s`
LOGNAME='rebackup'
LOGDIR="./logs"
LOGEXT="log"
LOGFILE="${LOGDIR}/${LOGNAME}.${LOGNUM}.${LOGEXT}"

# Sources:
# ~/Exclude/BACKUP/2012\ Feast\ -\ Kauai\ Photographs

rsync $opts -i --log-file=$LOGFILE --delete -avv \
~/Excludes/SRC                                   \
/Volumes/$DISK/BACKUP-RSYNC

