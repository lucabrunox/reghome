#!/usr/bin/env bash
while true; do nix-build $@ -A www >/dev/null; sleep 1; done
