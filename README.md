# zabbix-kvm
ZabbixでKVM関連の監視をやる拡張スクリプト
ShellScriptは`/etc/zabbix/`に置いておく

- /etc/zabbix/zabbix_agentd.conf
```
UserParameter=virsh.pool_status[*],/etc/zabbix/virsh-pool-status.sh $1
```

