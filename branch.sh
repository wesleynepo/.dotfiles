#!/bin/bash
read -p "Qual task? " task
user=$(git config --get user.name)
branch=$(echo "$user/$task")

git checkout develop && git pull && git checkout -b "$branch"
