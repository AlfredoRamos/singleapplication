#!/bin/bash --

# code coverage
java \
	-jar ~/codacy-coverage-reporter-assembly.jar report \
	-l Java \
	-r build/reports/jacoco/test/jacocoTestReport.xml
