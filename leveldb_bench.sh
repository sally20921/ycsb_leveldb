# A bench marking tool to execute different YCSB workload on Leveldb
plogdir=logs/workloads
# Execute for all workloads
for workload in a b c d e f; do
        logdir="$plogdir/workload${workload}";
        mkdir -p $logdir;
        echo "## WORKLOAD: $workload ##";
        # Support 3 naming schems: row major, column major and full row
        # Details in Bigtable_Rados.pdf.
       # for format in rowmajor colmajor fullrow; do
           # dbpath="/tmp/$format";
           # rm -rf $dbpath
           # echo "Format: $format"
            echo "Loading ...";
            workloadfile=workloads/workload${workload};
            # Creating of LevelDB database
            bin/ycsb load leveldb -P $workloadfile -p "leveldb.path=/home/sally20921/temp/leveldb-1.20" -p dump=true &> $logdir/load.out
            
            echo "Running ...";
	    #Running of LevelDB database
            bin/ycsb run leveldb -P workloads/workload${workload} -p "leveldb.path=/home/sally20921/temp/leveldb-1.20" &> $logdir/run.out


 done
