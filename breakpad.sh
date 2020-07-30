#!/bin/sh
read -p "please input so path:" so_file_name

./dump_syms ${so_file_name}.so > {so_file_name}.so.sym

head="$(head -n1 ${so_file_name}.so.sym)"

echo $head

array=(${head// / })

len = ${#array[@]}

echo $len

