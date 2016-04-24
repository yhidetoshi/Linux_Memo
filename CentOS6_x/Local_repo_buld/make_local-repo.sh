yum -y install yum-utils createrepo
cd /var/www/html/yum-repo/
reposync -r base -n -t /var/cache/yum
createrepo base/
reposync -r updates -n -t /var/cache/yum
createrepo updates/
reposync -r extras -n -t /var/cache/yum
createrepo extras/
reposync -r centosplus -n -t /var/cache/yum
createrepo centosplus/
reposync -r contrib -n -t /var/cache/yum
createrepo contrib/
