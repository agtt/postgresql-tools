PostgreSQL  Tools
=========================
Here is a PostgreSQL handful automatization tool repository.

### alter_index_tablespace.sh
This changes tablespace of all indexes in defined database 
>**Usage:**
>Edit ***DB*** and ***TBLSPC*** in script and run it (./alter_index_tablespace.sh)

### daily_partition.sh
This creates daily partitioned tables which keep 7 days of table. Partitions older than 7 days are droped.

>**Usage:**
>Edit settings and run it (./daily_partition.sh)

### dbstats_tracker.sh
Tracking growing ratios of tables and indexes by sending email according to defined ratio for PostgreSQL.
>**Usage:** 
>./dbstats_tracker.sh --max-ratio 1 --db dbname --user dbuser --email user@mail.com -update

### schema_tracker.sh
Tracking any schema ddl changes in given database by sending an email of those changes for PostgreSQL.
>**Usage:**
>./schema_tracker.sh --db dbname --user dbuser --email user@mail.com -update

### re_seq_db.sh
This script scan all tables in given database and fix table sequence number if there is any problem between last row id and its sequence id.
>**Usage:** set database name inside of script and run it.

### pg_logger.sh
This script collects daily PostgreSQL Logs from defined server list and makes them analyzed with pgfouine. 
>**Usage:** 
>Edit settings part in the script and run it daily with crontab. ***ssh-keys*** must be copied to servers which defined in settings


>**Note:** PostgreSQL weekly log format is used: ***postgresql-Fri.log*** - ***postgresql-Mon.log ****

### getbackup.sh
This simple PostgreSQL backup script takes the dump file of defined database and send information email when finihed. However, if there is a problem with backup sends error email.

>**Usage:**
>Edit settings part inside of script and run with crontab.

>**Note:**
>If you remove comments, this will erase backups older than 2 days.

### partitionize.sh
Partition a table according to given interval parameter (1 day, 1 month) which creates sub(partitionized) tables, inserts rows and creates triggers.
>**Note:**
>Edit settings part inside of script and run it.
