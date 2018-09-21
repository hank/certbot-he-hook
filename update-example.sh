export HE_USERNAME=user
export HE_PASSWORD=pw
export HE_ZONE=somezone
export HE_SUBDOMAIN=octopi

certbot certonly \
    --domain ${HE_SUBDOMAIN}.${HE_ZONE} \
    --email root@${HE_ZONE} \
    --preferred-challenges dns \
    --manual \
    --manual-auth-hook "/opt/certbot-he-hook.py"  \
    --manual-cleanup-hook "/opt/certbot-he-hook.py"  \
    --manual-public-ip-logging-ok

pushd /etc/letsencrypt/live/${HE_SUBDOMAIN}.${HE_ZONE}/
cat fullchain.pem privkey.pem > certandkey.pem
popd
