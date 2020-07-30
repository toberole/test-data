#!/bin/sh
read -p "please input so path:" so_file_name

touch ${so_file_name}.so.sym

chmod 777 ${so_file_name}.so.sym

./dump_syms ${so_file_name}.so > ${so_file_name}.so.sym

head="$(head -n1 ${so_file_name}.so.sym)"

echo $head

s1=""
s2=""
s3=""
dir1=""
dir2=""

eval $(echo $head | awk '{ printf("s1=%s;s2=%s;s3=%s;dir1=%s;dir2=%s",$1,$2,,$3,$4,$5)}')

echo $dir1

echo $dir2

