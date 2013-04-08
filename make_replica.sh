#!/bin/bash

#############################
## Script: make_replica.sh ##
## Coded by Erkin Çakar    ##
## Date: 08-04-2013        ##
#############################


VERSION="9.2"
HOST="10.22.22.138"
USER="moveme"
CONFPATH="~"
DATADIR="/var/lib/pgsql/$VERSION/data"
BASEBACKUP_BIN="/usr/pgsql-$VERSION/bin/pg_basebackup"
OUTPUT="/dev/null"

function throw_exception()
{
	if [ $? > 0 ]; then echo "ERROR: $1"; exit; fi
}

echo " ## Hot standby replication server is going to be settled down ##"
/etc/init.d/postgresql-$VERSION stop 2> $OUTPUT || throw_exception "Cannot stop PostgreSQL!"

rm -rf $DATADIR/* || throw_exception "Cannot be deleted Data directory!"
echo "   --> PostgreSQL data directory: \"$DATADIR\" is DELETED."
echo "   --> pg_basebackup tool is starting..."
BASEBACKUP_BIN -h $HOST -x -U $USER -D $DATADIR/ -l new_replica || throw_exception "Problem in pg_basebackup tool"
echo "   --> pg_basebackup completed! √"
cp $CONFPATH/postgresql.conf $CONFPATH/recovery.conf $DATADIR/ || throw_exception "Cannot be copied config files"
echo "   --> postgresql.conf & recovery.conf is copied to data directory"
chown -R postgres: $DATADIR/* || throw_exception "Owner of data directory cannot be changed!"
echo "   --> The owner of data directory setted to postgres"
echo " ## Hot standby PostgreSQL Server is ready to start! ##"

