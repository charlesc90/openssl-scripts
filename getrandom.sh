#!/bin/bash

# if a TPM2 device is available
tpm2_getrandom 32 | basenc --base64 > ~/random.dat

# if a TPM2 device is not available
# get data from the RNG
# dd if=/dev/random bs=32 count=1 of=/home/charlesc/random.dat status=progress
