# nginx-proxy-manager

This docker image uses the jc21's nginx-proxy-manager as starting point, but can add a custom ACME.</br>
<a href="https://github.com/NginxProxyManager/nginx-proxy-manager" target="_blank">https://github.com/NginxProxyManager/nginx-proxy-manager</a></p>

Tested in combination with smallstep/step-ca:latest docker.</br>
<a href="https://hub.docker.com/r/smallstep/step-ca/tags?name=latest" target="_blank">https://hub.docker.com/r/smallstep/step-ca/tags?name=latest</a></p>

An aditional file 80-custom.sh is added to the build and runs during boot.</br>
This file updates the ca-certificates when your private root-ca is mounted </br>
and recreates the letsencrypt.ini file if a custom acme (ACME_SERVER) is configured.</p>

To use your custom ACME, add the following to your docker-compose.yml file:
```yml
    environment:
      - ACME_SERVER="https://step-ca.example.com/acme/acme/directory"
      - ACME_EAB_KID="yourkid"
      - ACME_EAB_HMAC_KEY="yourkey"
      ...
    volumes:
      - ./certs:/usr/local/share/ca-certificates:ro
      ...
```
