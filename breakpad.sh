#!/bin/sh
read -p "please input so path:" so_file_name

touch ${so_file_name}.so.sym

chmod 777 ${so_file_name}.so.sym

./dump_syms ${so_file_name}.so > ${so_file_name}.so.sym

head="$(head -n1 ${so_file_name}.so.sym)"

echo $head

dir1=`echo $head | awk '{print $4}'`
dir2=`echo $head | awk '{print $5}'`

echo $dir1

echo $dir2

