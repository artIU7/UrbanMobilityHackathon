#!/bin/bash
echo "In Path :"
pwd
git add .
git commit -m "auto commit rep - project's"
git branch -M main
git push -u origin main
