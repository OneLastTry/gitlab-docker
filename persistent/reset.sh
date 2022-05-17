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

cd runners
rm -rf *
mkdir node1
mkdir node2
mkdir node3
mkdir node4
touch node1/.gitkeep
touch node2/.gitkeep
touch node3/.gitkeep
touch node4/.gitkeep
cd ..