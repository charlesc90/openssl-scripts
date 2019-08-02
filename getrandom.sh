#!/bin/bash

# get data from the RNG
dd if=/dev/random bs=32 count=1 of=/home/charlesc/random.dat status=progress
