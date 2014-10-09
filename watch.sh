#!/usr/bin/env bash
while true; do nix-build -A static >/dev/null; sleep 1; done