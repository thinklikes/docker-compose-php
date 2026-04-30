#!/bin/bash
set -e

CONSUL_URL="http://localhost:8500"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
KV_FILE="${SCRIPT_DIR}/kv-init.json"
TOKEN_FILE="${SCRIPT_DIR}/.token"

if [ ! -f "${TOKEN_FILE}" ]; then
  echo "ERROR: Token file not found at ${TOKEN_FILE}"
  exit 1
fi

TOKEN=$(cat "${TOKEN_FILE}")

echo "Waiting for Consul to be ready..."
until curl -sf "${CONSUL_URL}/v1/status/leader" > /dev/null 2>&1; do
  sleep 1
done
echo "Consul is ready."

echo "Importing KV from ${KV_FILE}..."
python3 - <<EOF
import json, subprocess, sys

with open("${KV_FILE}") as f:
    entries = json.load(f)

for entry in entries:
    key   = entry["key"]
    value = entry["value"]
    result = subprocess.run(
        ["curl", "-sf", "-X", "PUT", "-H", "X-Consul-Token: ${TOKEN}", "-d", value, "${CONSUL_URL}/v1/kv/" + key],
        capture_output=True
    )
    if result.returncode == 0:
        print(f"  SET {key}")
    else:
        print(f"  FAILED {key}: {result.stderr.decode()}", file=sys.stderr)
        sys.exit(1)
EOF

echo "KV import complete."
