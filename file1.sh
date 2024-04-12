#!/usr/bin/bash
R='\033[0;31m' ;  #'0;31' is Red's ANSI color code
G='\033[0;32m';   #'0;32' is Green's ANSI color code
Y='\033[1;33m';   #'1;32' is Yellow's ANSI color code
B='\033[0;34m';   #'0;34' is Blue's ANSI color code
uname -o -s -r;
echo -e  "Current Directory${R} $(pwd)";
echo "NO OF FILES | FILE TYPE | CTIME | ATIME | SIZE | CHECKSUM " > conf.txt;
var=0;

for i in *.txt
do
  echo $i | lolcat
  ((var=var+1))
done
echo $((var=var-1));
i=1
while [[ $i -le $var ]]  
do
     ctime=`ls -lu $i.txt | cut -d " " -f 8`;
     echo -e "  $i         |  TXT      |  $ctime " >> conf.txt
     ((i+=1))
done
