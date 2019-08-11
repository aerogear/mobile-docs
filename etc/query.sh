#!/bin/bash
echo $SHELL

q -H -t -O -D , "SELECT Level,Type,ModuleID,Title,Comments,Jira
FROM ./temp-data-sync.csv.tsv"  > output.csv
