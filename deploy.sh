#!/bin/bash
set -euo pipefail
APP_NAME="${PROJECT_NAME}"
install_node_deps() {
  if [ -f package-lock.json ] || [ -f npm-shrinkwrap.json ]; then
    echo "[DISAL] Installing with npm ci (lockfile found)"
    npm ci
  else
    echo "[DISAL] Installing with npm install (no lockfile found)"
    npm install
  fi
}
install_node_deps
pm2 delete "${APP_NAME}" 2>/dev/null || true
if command -v pm2 &>/dev/null; then
  PORT="${ASSIGNED_PORT}" pm2 start npm --name "${APP_NAME}" -- start
  pm2 save --force
else
  PORT="${ASSIGNED_PORT}" nohup npm start > "/tmp/disal-${APP_NAME}.log" 2>&1 &
fi
sleep 3
curl -fsS "http://127.0.0.1:${ASSIGNED_PORT}/health"
echo "[DISAL] Node Express test is live on ${ASSIGNED_PORT}"
