#!/bin/bash
echo $SHELL
ssconvert -S brownfield.gnumeric temp-%s.csv

for filename in ./*.csv; do

 sed -E 's/("([^"]*)")?,/\2\t/g' $filename > $filename.tsv

done


q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp-getting-started.csv.tsv WHERE Category = '.'" > nebel-getting-started.csv

q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp-data-sync.csv.tsv WHERE Category = '.'" > nebel-data-sync.csv

q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp-push.csv.tsv WHERE Category = '.'" > nebel-push.csv

q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp-idm.csv.tsv WHERE Category = '.'" > nebel-idm.csv

q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp-security.csv.tsv WHERE Category = '.'" > nebel-security.csv

q -H -t -O -D , "SELECT Category,UserStory,Type,ModuleID,Title,VerifiedInVersion,QuickstartID,Comments,Jira
FROM ./temp-showcase.csv.tsv WHERE Category = '.'" > nebel-showcase.csv

