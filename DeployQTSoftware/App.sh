#!/bin/sh
appname=`basename $0 | sed s,\.sh$,,`

dirname=`dirname $0`
tmp="${dirname#?}"

if [ "${dirname%$tmp}" != "/" ]; then
dirname=$PWD/$dirname
fi
LD_LIBRARY_PATH=$dirname   #set this to the lib lirary , we can change to any folder that we want 
export LD_LIBRARY_PATH
$dirname/$appname "$@"     #run app with all parameter we pass to 
