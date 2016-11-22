#!/bin/bash
grep entry accounts.xml | awk -F '"' '{print $2}' | while IFS= read -r account
do
  server=$(echo "$account" | awk -F '@' '{print $2}')
  echo "testing $server"
  java -jar target/ComplianceTester-0.1.jar "$account" > "reports/$server.txt"
done
