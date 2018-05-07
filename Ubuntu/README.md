# README (Ubuntu勉強用)

#### Ubuntuのバージョン確認
- `# cat /etc/os-release`
```
NAME="Ubuntu"
VERSION="16.04.4 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.4 LTS"
```

#### Nginx install

```
$ curl http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
$ VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2` && sudo -E sh -c "echo \"deb http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> /etc/apt/sources.list"
$ VCNAME=`cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d= -f2` && sudo -E sh -c "echo \"deb-src http://nginx.org/packages/ubuntu/ $VCNAME nginx\" >> /etc/apt/sources.list"
$ sudo apt-get update
$ sudo apt-get install nginx
```

`# diff -u sources.list.org sources.list`
```
--- sources.list.org	2018-05-02 23:29:34.571376214 +0000
+++ sources.list	2018-05-02 23:31:06.338263406 +0000
@@ -55,3 +55,5 @@
 ## respective vendors as a service to Ubuntu users.
 # deb http://archive.canonical.com/ubuntu xenial partner
 # deb-src http://archive.canonical.com/ubuntu xenial partner
+deb http://nginx.org/packages/ubuntu/ xenial nginx
+deb-src http://nginx.org/packages/ubuntu/ xenial nginx
```

#### systemd
- Nginx
  - `/etc/systemd/system/multi-user.target.wants/nginx.service`
  
#### セキュアOS（AppArmor / SELinux）
- SELinux
  - RHEL系
- AppArmor
  - Ubuntu

#### AppArmorの確認・無効化
- `# apparmor_status`
```
apparmor module is loaded.
14 profiles are loaded.
14 profiles are in enforce mode.
   /sbin/dhclient
   /usr/bin/lxc-start
   /usr/lib/NetworkManager/nm-dhcp-client.action
   /usr/lib/NetworkManager/nm-dhcp-helper
   /usr/lib/connman/scripts/dhclient-script
   /usr/lib/lxd/lxd-bridge-proxy
   /usr/lib/snapd/snap-confine
   /usr/lib/snapd/snap-confine//mount-namespace-capture-helper
   /usr/lib/snapd/snap-confine//snap_update_ns
   /usr/sbin/tcpdump
   lxc-container-default
   lxc-container-default-cgns
   lxc-container-default-with-mounting
   lxc-container-default-with-nesting
0 profiles are in complain mode.
1 processes have profiles defined.
1 processes are in enforce mode.
   /sbin/dhclient (922)
0 processes are in complain mode.
0 processes are unconfined but have a profile defined.
```
