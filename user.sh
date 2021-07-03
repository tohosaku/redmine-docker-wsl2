USER_ID=`id | sed -e 's/^uid=\(.*\)(\(.*\)) gid=.*$/\1/'`
GROUP_ID=`id | sed -e 's/uid=.* gid=\(.*\)(\(.*\)) groups=.*/\1/'`
