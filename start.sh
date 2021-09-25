#!/bin/bash

echo "Starting tests..."
npx cypress run --env allure=true,allureResultsPath=allure-results
allure serve -p 8787 /allure-results