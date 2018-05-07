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
- 確認コマンド
  - `# apparmor_status`
- 無効化
  - `vi /etc/default/grub`
    - `GRUB_CMDLINE_LINUX="apparmor=0"`
  - `# update-grub`
  - `# reboot`

- # apparmor_status
  - 以下が表示される
```
apparmor module is loaded.
apparmor filesystem is not mounted
```
