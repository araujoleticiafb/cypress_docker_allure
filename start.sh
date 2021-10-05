#!/bin/bash

if [ $@ = "local" ]
  then
    rm -r allure-results/ allure-report
    echo "Starting local tests..."
    cypress run --env allure=true
    allure generate allure-results
else
  echo "Starting tests..."
  echo -e 'pcm.!default {\n type hw\n card 0\n}\n\nctl.!default {\n type hw\n card 0\n}' > ~/.asoundrc
  npx cypress run --env allure=true,allureResultsPath=allure-results
  allure serve -p 8787 /allure-results
fi
