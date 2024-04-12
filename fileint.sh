#!/usr/bin/bash
if [ $(id -u ) -eq 0 ]
then
cowsay -f daemon devilcorp | lolcat;
uname -o -s -r | lolcat;
check="/checksum"
files=("/home/malefax/chatbot" "/home/malefax/file_integrity");
for i in "${files[@]}"
do
if [ ! -d $i ]
then
	echo "$i:directory doesnt exist" | lolcat
	exit 1;
else
	continue
fi
done
for i in "${files[@]}" 
do
  cd $i;
  sha_checksum="$i$check";
  echo "current directory:$i"| lolcat
  if [ -f $sha_checksum ];
  then
  ls -lah $i;
  sed -i '/checksum/d' checksum
  sed -i '/fileint.sh/d' checksum
  echo "generated hash for the current directory:$i"| lolcat;
  cat checksum
  sha256sum -c checksum;
  else
  echo "Creating sha256 check sum file"| lolcat;
  touch checksum;
  ls -lah $i;
  sha256sum * > checksum;
  sed -i '/checksum/d' checksum
  sed -i '/fileint.sh/d' checksum
  echo "generated hash for the current directory:$i" | lolcat;
  cat checksum
  sha256sum -c checksum;
  fi
done
else
echo "run in root!";
exit 1
fi

