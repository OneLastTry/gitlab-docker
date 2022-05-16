#!/bin/bash

cd gitlab
rm -rf *
mkdir config
mkdir data
mkdir logs
touch config/.gitkeep
touch data/.gitkeep
touch logs/.gitkeep
cd ..