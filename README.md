# MyNodeBTC_Install
Shell Script to setup the Praia Bitcoin implementation for MyNodeBTC 2.4.5 OVA Distribution

Activate ngnix sites for BtcPay, Lndhub, LnBits, RPC Explorer, Mempool,  to listen SSL at port 49393

Usage 

´´´
sudo su
cd /home/admin/
mkdir scripts 
cd scripts
git clone https://github.com/PraiaBitcoin/MyNodeBTC-Install
cd MyNodeBTC-Install
chmod 755 install.sh
./install --domain seudominio.org
´´´
