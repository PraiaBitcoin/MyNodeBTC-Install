#!/bin/bash
$configdir=/home/admin/scripts/MyNodeBTC-Install/
$domain=

sudo su
apt-get install sed

#https://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands
#find and replace
echo "Preparando as configurações"
sed -i 's/seudominio.org/$domain/g' etc/nginx/sites-enabled/https_btcpayserver-alt.conf
sed -i 's/seudominio.org/$domain/g' etc/nginx/sites-enabled/https_btcrpcexplorer-alt.conf
sed -i 's/seudominio.org/$domain/g' etc/nginx/sites-enabled/https_lnbits-alt.conf
sed -i 's/seudominio.org/$domain/g' etc/nginx/sites-enabled/https_lndhub-alt.conf
sed -i 's/seudominio.org/$domain/g' etc/nginx/sites-enabled/https_mempoolspace-alt.conf

echo "Copiando arquivos de configuração"
 /home/admin/scripts/MyNodeBTC-Install/etc/nginx/sites-enabled/https_btcpayserver-alt.conf /etc/nginx/sites-enabled/https_btcpayserver-alt.conf
echo "BTCPayServer ativado."
cp /home/admin/scripts/MyNodeBTC-Install/etc/nginx/sites-enabled/https_btcrpcexplorer-alt.conf /etc/nginx/sites-enabled/https_btcrpcexplorer-alt.conf
echo "Explorer ativado."
cp /home/admin/scripts/MyNodeBTC-Install/etc/nginx/sites-enabled/https_lnbits-alt.conf /etc/nginx/sites-enabled/https_lnbits-alt.conf
echo "LnBits ativada."
cp /home/admin/scripts/MyNodeBTC-Install/etc/nginx/sites-enabled/https_lndhub-alt.conf /etc/nginx/sites-enabled/https_lndhub-alt.conf
echo "LndHub ativado."
cp /home/admin/scripts/MyNodeBTC-Install/etc/nginx/sites-enabled/https_mempoolspace-alt.conf /etc/nginx/sites-enabled/https_mempoolspace-alt.conf 
echo "Mempool ativado."
echo "Reiniciando Nginx"
/etc/init.d/nginx restart
