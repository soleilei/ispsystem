#!/bin/bash
#Скрипт для сборки всех версий тестов Billmanager
#IP - адрес виртуалки, на которой будет проводится сборка. 

IP=1.1.1.1;

rsync  -vrc --exclude .git /home/irina/src/tests/ root@$IP:/usr/local/mgr5/tests/

ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr ADVANCED=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr CORPORATE=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr ISPSYSTEM=yes'

ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr ADVANCED=yes RESALE=yes CORP_FOR_ADV=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr CORPORATE=yes RESALE=yes CORP_FOR_CORP=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr ADVANCED=yes RESALE=yes MY_FOR_ADV=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr CORPORATE=yes RESALE=yes MY_FOR_CORP=yes'

ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr INTEG=yes BILL_ISPMGR=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr INTEG=yes BILL_VEMGR=yes'
ssh root@$IP 'cd /usr/local/mgr5/tests/;  make clean; make billmgr INTEG=yes BILL_VMMGR=yes'
