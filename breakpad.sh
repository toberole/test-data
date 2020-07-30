#!/bin/sh
read -p "please input so path:" so_file_path
read -p "please input dmp name:" dmp_path

cp so_file_path ./crash.so
cp dmp_file_path ./crash_dmp.dmp

touch crash.so.sym

chmod 777 crash.so.sym

./dump_syms crash.so > crash.so.sym

head="$(head -n1 crash.so.sym)"

echo $head

dir1=`echo $head | awk '{print $4}'`
dir2=`echo $head | awk '{print $5}'`

echo $dir1
echo $dir2

mkdir -p symbols/$dir2/$dir1

mv crash.so.sym symbols/$dir2/$dir1

./minidump_stackwalk crash_dmp.dmp symbols > crash.log

