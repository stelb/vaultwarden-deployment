#!/bin/sh
kubectl -n vaultwarden create secret generic admin \
  --from-literal="token=generate" \
  --dry-run=client -save-config -o json | \
  kubectl -n vaultwarden apply -f -
kubectl -n vaultwarden create secret generic smtp \
  --from-literal="user=yoursmtpuser" \
  --from-literal="password=yoursmtppassword" \
  --dry-run=client -save-config \
  -o json | \
  kubectl -n vaultwarden apply -f -
