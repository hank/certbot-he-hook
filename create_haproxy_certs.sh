# When called as a certbot hook, will create haproxy certs for every renewed domain
set -e
for domain in $RENEWED_DOMAINS; do
    pushd /etc/letsencrypt/live/${domain}
    cat fullchain.pem privkey.pem > certandkey.pem
    popd
done
# Restart haproxy
service haproxy restart
