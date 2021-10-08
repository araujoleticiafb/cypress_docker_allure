#!/bin/bash
rm -r allure-results/ allure-report

if [ "$#" -eq  "0" ]
  then
    echo "Set if test should execute local or ci, and no-tag or @tagsName"
elif [[ ( $1 == "local" && $2 == "no-tag" ) ]]
  then
    echo "Starting local tests..."
    cypress run --env allure=true
    allure generate allure-results
elif [[ ( $1 == "local" && $2 != "no-tag" ) ]]
  then
    echo "Starting local tests with TAG ${2}..."
    cypress-tags run --env TAGS="${2}",allure=true
    allure generate allure-results  
elif [[ ( $1 == "ci" && $2 == "no-tag" ) ]]
  then
    echo "Starting tests..."
    echo -e 'pcm.!default {\n type hw\n card 0\n}\n\nctl.!default {\n type hw\n card 0\n}' > ~/.asoundrc
    npx cypress run --env allure=true,allureResultsPath=allure-results
    allure serve -p 8787 /allure-results   
else
  echo "Starting tests with TAG ${2}..."
  echo -e 'pcm.!default {\n type hw\n card 0\n}\n\nctl.!default {\n type hw\n card 0\n}' > ~/.asoundrc
  npx cypress run --env TAGS="${2}",allure=true,allureResultsPath=allure-results
  allure serve -p 8787 /allure-results
fi