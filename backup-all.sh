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

set -u # exit over uninitialised variables

T=""; # dry run, test mode OFF
T="-n"; # dry run, test mode ON
opts="--exclude='*/.git'"
opts=""
opts="$opts $T "
# use default identy, ssh key, don't need to pass parms to SSH
# -i, --itemize-changes       output a change-summary for all updates
#     --log-file=FILE         log what we're doing to the specified FILE
#     -v, --verbose               increase verbosity
#     -a, --archive               archive mode; same as -rlptgoD (no -H)
#     -r, --recursive             recurse into directories
#     -t, --times                 preserve times

## LACIE drive
# logging and log naming.
LOGNUM=`date +%s`
LOGNAME='lacie'
LOGDIR="./logs"
LOGEXT="log"
LOGFILE="${LOGDIR}/${LOGNAME}.${LOGNUM}.${LOGEXT}"

rsync $opts -i --log-file=$LOGFILE --delete -avv       \
~/Excludes/BACKUP/2012\ Feast\ -\ Kauai\ Photographs   \ 
~/Excludes/SD\ cards                                   \
~/Excludes/Star_Trek                                   \
/Volumes/LacieRugged/BACKUP-RSYNC




## MAXTOR drive
# logging and log naming.
LOGNUM=`date +%s`
LOGNAME='maxtor'
LOGDIR="./logs"
LOGEXT="log"
LOGFILE="${LOGDIR}/${LOGNAME}.${LOGNUM}.${LOGEXT}"

rsync $opts -i --log-file=$LOGFILE --delete -avv    \
~/Excludes/SD\ cards                                \
~/Excludes/Star_Trek                                \
~/Excludes/Star_Wars                                \
~/Excludes/cloud.Lyndell.NET                        \
~/Excludes/VIDEOS                                   \
~/Excludes/2012\ Chili\ Supper\ -\ Source           \
/Volumes/Maxtor/BACKUP-RSYNC

