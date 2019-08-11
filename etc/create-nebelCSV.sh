#!/bin/bash
echo $SHELL
ssconvert brownfield.gnumeric temp.csv

sed -E 's/("([^"]*)")?,/\2\t/g' temp.csv > temp.tsv

q -H -t -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp.tsv WHERE Category = '.'"

