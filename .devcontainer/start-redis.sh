#!/usr/bin/env bash
# Start redis each time the codespace starts; the suite's storage tests use it. Idle otherwise.
cd "$(dirname "$0")/.."
if ! redis-cli ping >/dev/null 2>&1; then
  redis-server redis.conf --daemonize yes >/dev/null 2>&1 || redis-server --daemonize yes >/dev/null 2>&1
fi
