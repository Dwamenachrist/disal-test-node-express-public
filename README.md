# DISAL Test: Node Express

Small real project for DISAL end-to-end deployment testing.

## What this tests

- Node backend process
- PORT environment variable handling
- PM2 process management
- `/health` endpoint

## DISAL deployment

1. Create a project in DISAL.
2. Connect this repository and select `main`.
3. Use the included `deploy.sh` as the project deploy script.
4. Deploy and open the assigned `SERVER_IP:PORT` URL.

Expected result: the page or `/health` endpoint returns a successful response showing the DISAL-assigned port.

## Project type

Express HTTP API.
