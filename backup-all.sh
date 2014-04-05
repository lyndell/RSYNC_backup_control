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

## LACIE drive
function RunLacie {
  T="-n"; # dry run, test mode ON
  T=""; # dry run, test mode OFF
  opts="--exclude='*/.git'"
  opts="--exclude='VIDEOS/_MISC/'"
  opts="$opts $T "
  # use default identy, ssh key, don't need to pass parms to SSH
  # -i, --itemize-changes       output a change-summary for all updates
  #     --log-file=FILE         log what we're doing to the specified FILE
  #     -v, --verbose               increase verbosity
  #     -a, --archive               archive mode; same as -rlptgoD (no -H)
  #     -r, --recursive             recurse into directories
  #     -t, --times                 preserve times

  # logging and log naming.
  LOGNUM=`date +%s`
  LOGNAME='lacie'
  LOGDIR="rsync.logs"
  LOGEXT="log"
  LOGFILE="${LOGDIR}/${LOGNAME}.${LOGNUM}.${LOGEXT}"

#  ~/Excludes/VIDEOS/Star_Trek                             \
#  rsync $opts -i --log-file=$LOGFILE --delete -avv       \
  rsync $opts --log-file=$LOGFILE --delete -avvi           \
  ~/Excludes/BACKUP                                       \
  ~/Excludes/SD\ cards                                    \
  /Volumes/LacieRugged/BACKUP-RSYNC
}
RunLacie

