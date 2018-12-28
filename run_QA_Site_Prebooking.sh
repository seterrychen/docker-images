#!/usr/bin/env bash

DOCKER_ARGS=""

source_dir=$1
if [ ! -d "$source_dir" ]; then
    echo "Usage: [DISPLAY_SETTING=1024x768x24] run_QA_Site_Prebooking.sh source_folder [report_folder]"
    exit 1;
fi

reports_dir=$2
if [ -d "$reports_dir" ]; then
    DOCKER_ARGS="-e REPORT_DIR=${reports_dir}"
fi

docker run -t --rm -e DISPLAY_CONFIGURATION=${DISPLAY_SETTING:-1024x768x24} -v "$source_dir":/katalon/katalon/source -v "$reports_dir":/katalon/katalon/report seterrychen/katalon:latest katalon-execute.sh -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/TS_RegressionTest"
