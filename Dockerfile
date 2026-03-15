#update:18-02-2026

FROM docker.io/jc21/nginx-proxy-manager:latest

COPY 80-custom.sh /etc/s6-overlay/s6-rc.d/prepare/80-custom.sh

RUN chmod +x /etc/s6-overlay/s6-rc.d/prepare/80-custom.sh \
    && sed -i '/\. \/etc\/s6-overlay\/s6-rc.d\/prepare\/60-secrets\.sh/a \. /etc/s6-overlay/s6-rc.d/prepare/80-custom.sh' /etc/s6-overlay/s6-rc.d/prepare/00-all.sh
