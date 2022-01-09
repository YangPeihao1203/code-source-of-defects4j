#!/bin/bash
set -e
for bug in `seq 1 18`
do 
   echo "handling ${bug}"
   tmp_file=patches/${bug}.src.patch
   #echo ${tmp_file}
   count=`cat ${tmp_file}|grep @@|wc -l`
   #echo ${count}
   if [ $count -gt 2 ]
   then
      echo "大于2，不要"
      continue
   elif [ $count == 2 ]
   then
      #echo "等于2"
      insert_count=`cat ${tmp_file}|grep  '^-.*'}|wc -l`
      #echo $insert_count
      if [ $insert_count != 1 ]
      then
	#echo "虽然等于2，但是不符合条件"
	continue
      fi
   else
      echo "等于1，满足条件"
   fi

   path_prefix=`cat ${tmp_file} |grep '^---'|cut -d / -f 1`
   #echo ${path_prefix}
   if [ "${path_prefix}" != "--- a" ]
   then 
      echo "前缀不符合格式，退出"
      continue
   fi

   path_suffix=`cat ${tmp_file} |grep '^---'|cut -d / -f 2-20`
   #echo $path_suffix
   echo "/home/yph/projects/codec_bug/codec_${bug}/${path_suffix}"
   echo "/home/yph/projects/codec_fix/codec_${bug}/${path_suffix}"
   #echo ${bug_path}
   #echo ${fix_path}
   #chmod +x ${bug_path}
   #chmod +x ${fix_path}
   cp ~/projects/codec_bug/codec_${bug}/${path_suffix} ~/projects/codec/bug/
   cp ~/projects/codec_fix/codec_${bug}/${path_suffix} ~/projects/codec/fix/
   file_name=`basename ~/projects/codec_bug/codec_${bug}/${path_suffix}`
   echo ${file_name}
   mv ~/projects/codec/bug/${file_name} ~/projects/codec/bug/${bug}.txt
   mv ~/projects/codec/fix/${file_name} ~/projects/codec/fix/${bug}.txt

    
done





   

