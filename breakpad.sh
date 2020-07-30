#!/bin/sh
read -p "please input so path:" so_file_path
read -p "please input dmp name:" dmp_file_path

so_file_name=$(basename ${so_file_path})
dmp_file_name=$(basename ${dmp_file_path})

cp $so_file_path so_file_name

cp $dmp_file_path dmp_file_name

chmod 777 so_file_name
chmod 777 dmp_file_name

touch $so_file_name.sym

chmod 777 $so_file_name.sym


./dump_syms $so_file_name.so > $so_file_name.sym

head="$(head -n1 $so_file_name.sym)"

echo $head

dir1=`echo $head | awk '{print $4}'`
dir2=`echo $head | awk '{print $5}'`

echo $dir1
echo $dir2

mkdir -p symbols/$dir2/$dir1

mv $so_file_name.sym symbols/$dir2/$dir1

./minidump_stackwalk $dmp_file_name symbols > crash.log

