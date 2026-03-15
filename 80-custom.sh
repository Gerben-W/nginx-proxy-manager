echo "[80-custom] Running custom prepare step..."

echo "[80-custom] Updating CA certificates..."
update-ca-certificates


# Only create acme.ini if ACME_SERVER is provided
if [ -n "${ACME_SERVER:-}" ]; then
  echo "[80-custom] Creating /etc/letsencrypt.ini"

  cat > /etc/letsencrypt.ini <<EOF
server = ${ACME_SERVER}
eab-kid = ${ACME_EAB_KID:-}
eab-hmac-key = ${ACME_EAB_HMAC_KEY:-}
EOF

  chmod 600 /etc/letsencrypt.ini

  echo "[80-custom] /etc/letsencrypt.ini created"
else
  echo "[80-custom] ACME_SERVER not set, skipping letsencrypt.ini creation"
fi

echo "[80-custom] Custom prepare step completed."
