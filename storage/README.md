## Storage

This is a convention to have data better organized.

<code>
mkdir /storage
mkdir /storage/www
mkdir /storage/www/public
mkdir /storage/www/server
mkdir /storage/git
mkdir /storage/ftp
</code>

- `/storage/www/public` is for main server
- `/storage/www/server` is for a subdomain that will use http_auth for browsing for apc/memcache admin, phpinfo, adminer etc.
- `/storage/ftp` is for pureftpd
- `/storage/git` is for git repos