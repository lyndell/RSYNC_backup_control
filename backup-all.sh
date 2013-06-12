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

# Sources:
# ~/Exclude/BACKUP/2012\ Feast\ -\ Kauai\ Photographs

# use default identy, ssh key, don't need to pass parms to SSH
rsync $opts -i --log-file=$LOGFILE --delete -avv 
~/Exclude/BACKUP/VPS
/Volumes/LacieRugged/BACKUP-RSYNC
# -i, --itemize-changes       output a change-summary for all updates
#     --log-file=FILE         log what we're doing to the specified FILE
#     -v, --verbose               increase verbosity
#     -a, --archive               archive mode; same as -rlptgoD (no -H)
#     -r, --recursive             recurse into directories
#     -t, --times                 preserve times



tail $LOGFILE

