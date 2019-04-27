#!/bin/bash --

set -e

# code coverage
travis_retry curl -L -o codacy-coverage-reporter "$(curl -L https://api.github.com/repos/codacy/codacy-coverage-reporter/releases/latest | jq -r '.assets | map({name, browser_download_url} | select(.name | contains("codacy-coverage-reporter-linux"))) | .[0].browser_download_url')"

chmod +x ./codacy-coverage-reporter

./codacy-coverage-reporter report \
	-l Java \
	-r build/reports/jacoco/test/jacocoTestReport.xml
