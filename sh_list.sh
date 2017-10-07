#!/bin/sh

#######################################################################################
##删除文件中关键字“名称”只出现一次的行

# 样例文件 file.txt #
#id name memo
#1 char_def abc
#2 string_def abc
#3 int_def abc
#4 float_def abc
#5 string_def abc
#f1 hehe string_def
#f2 hehe string_def

# 脚本
cat file.txt| grep _def|sed 's/.* "\(.*_def\)" .*/\1/' \ # 找出名称字段
|sort \ # 排序
| uniq -u \ # 查找只出现过一次的名称
|while read line ;do; sed -i .bak "/$line/d" file.txt ; done # 删除文件中名称只出现一次的行

# 删除后的文件 file.txt #
#2 string_def abc
#5 string_def abc
#f1 hehe string_def
#f2 hehe string_def
#######################################################################################
