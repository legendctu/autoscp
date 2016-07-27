#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Usage: ${0} <pwd_file> <targets_file>"
    exit 1
fi

if [ ! -f $1 ]; then
    echo "Password File Not Found."
    exit 2
fi

if [ ! -f $2 ]; then
    echo "Targets File Not Found."
    exit 3
fi

missionRoot=`date +%Y%m%d%H%M`

echo "#!/usr/bin/expect -f" > tmpexpect
while read line; do
    target=`echo $line|sed "s/\//_/g"|sed "s/_//"`
    awk '{
        system("mkdir -p "'${missionRoot}'"/"$1);
        print "";
        print "spawn scp -P "$3" "$2"@"$1":'${line}' '${missionRoot}'/"$1"/'${target}'";
        print "expect \"*password:*\"";
        print "send \""$4"\\r\"";
        print "interact";
        print "";
    }' $1 >> tmpexpect
done < $2

chmod 700 tmpexpect

./tmpexpect
