#!/bin/bash
echo $SHELL
ssconvert -S brownfield.gnumeric temp-%s.csv

for filename in ./*.csv; do

 sed -E 's/("([^"]*)")?,/\2\t/g' $filename > $filename.tsv

 q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./$filename.tsv WHERE Category = '.'" > nebel$filename

done

