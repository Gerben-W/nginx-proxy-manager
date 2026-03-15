# nginx-proxy-manager

This docker image uses the jc21's nginx-proxy-manager as starting point, but can add a custom acme.</br>
<a href="https://github.com/NginxProxyManager/nginx-proxy-manager" target="_blank">https://github.com/NginxProxyManager/nginx-proxy-manager</a></p>

An aditional file 80-custom.sh is added to the build and runs during boot.</br>
This file updates the ca-certificates when your private root-ca is mounted </br>
and recreates the letsencrypt.ini file if a custom acme (ACME_SERVER) is configured.</p>

To use your cusom acme, add the following to your docker-compose.yml file:
```yml
    environment:
      - ACME_SERVER="https://step-ca.example.com/acme/acme/directory"
      - ACME_EAB_KID="yourkid"
      - ACME_EAB_HMAC_KEY="yourkey"
    volumes:
      - ./certs:/usr/local/share/ca-certificates:ro
```
