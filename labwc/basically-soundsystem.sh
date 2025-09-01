#!/bin/bash

# jackd -d alsa -r 48000 -p 256 -n 2 2>&1 &

pipewire 2>&1 &

pipewire-pulse 2>&1 &

wireplumber 2>&1 &

