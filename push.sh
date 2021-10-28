#!/bin/bash
	
git add .
git status
read -p "Enter Your commit: " x
git commit -m "${x}"
git push
