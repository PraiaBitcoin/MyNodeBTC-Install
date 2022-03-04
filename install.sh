#!/bin/bash

configdir=$(dirname $0)
destino=/etc/nginx/sites-enabled
domain=

cmd=$0

if [ ! -f /bin/sed ]
then
   apt-get install sed
fi

while [[ $# -gt 0 ]]; do
  case $1 in
      -d|--domain)
      domain="$2"
      shift 
      shift 
      ;;
   *)
     echo "Unknown option $1"
     shift
     ;;
   esac
 done
  
if [ -z "$domain" ]
then
   echo "$cmd [-d |--domain ] your.domain"
   exit 1
fi


install -d "$destino"

for i in $configdir/etc/nginx/sites-enabled/*.conf
do
   if [ ! -f "$i" ]
   then
      copntinue
   fi
         
   f=$destino/$(basename $i)
   
   if [ -f $f ]
   then
     echo "File $f already exists... Skiping"
     continue
   fi  
   
   if [ ! -f $f ] 
   then
      echo Processing file $f
      cp "$i" "$f"
      sed -i "s/seudominio.org/$domain/g" $f
   fi   
done

echo "Reiniciando Nginx"
/etc/init.d/nginx restart

exit 0

