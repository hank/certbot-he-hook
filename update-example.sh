export HE_USERNAME=user
export HE_PASSWORD=pw
export HE_ZONE=some.domain

certbot certonly \
    --domain pi.some.domain \
    --email root@some.domain \
    --preferred-challenges dns \
    --manual \
    --manual-auth-hook "/opt/certbot-he-hook.py"  \
    --manual-cleanup-hook "/opt/certbot-he-hook.py"  \
    --manual-public-ip-logging-ok
