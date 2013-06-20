#!/bin/bash -x
#
##############################################################################
#
# FILE:  VIDEO.server.sh
# DESC:  Synchronizes one directory from a remote server over SSH 
#
# NAME:  Lyndell Rottmann
# EMAIL: Lyndell@Lyndell.US
#
#
#

set -u # exit over uninitialised variables

# logging and log naming.
LOGNUM=`date +%s`
LOGNAME='video'
LOGDIR="./rsync.logs"
LOGEXT="log"
LOGFILE="${LOGDIR}/${LOGNAME}.${LOGNUM}.${LOGEXT}"

# rsync options
T="-n"; # dry run, test mode ON
T=""; # dry run, test mode OFF
IFL="--include-from=video-include.txt"
IFL=""
XFL="--exclude-from=video-exclude.txt"
opts="$T $IFL $XFL"

# remote server login details
USER="root"
HOST="cloud.Lyndell.NET"
SRCDIR="/home/videos/*"
DSTDIR="/Users/lyndell/Excludes/VIDEOS.server/"
SRC="${USER}@${HOST}:${SRCDIR}"

# use default identy, ssh key, don't need to pass parms to SSH
# -i, --itemize-changes       output a change-summary for all updates
#     --log-file=FILE         log what we're doing to the specified FILE
#     -v, --verbose               increase verbosity
#     -a, --archive               archive mode; same as -rlptgoD (no -H)
#     -r, --recursive             recurse into directories
#     -t, --times                 preserve times
#
# conseve bandwidth, will slowdown backup/sychronization
# not necessary on the SoftLayer private network
# uncomment line below to set.  default is full speed.
#
# BWLIMIT="--bwlimit=384"
#
BWLIMIT=""
rsync $opts -i --log-file=$LOGFILE --delete -avv $BWLIMIT $SRC $DSTDIR


tail $LOGFILE

