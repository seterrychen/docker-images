#!/usr/bin/env bash
# Skip set -e to save the reports

echo "Starting Katalon Studio"
cat $KATALON_VERSION_FILE

# create tmp directory
workspace_dir=/tmp/katalon_execute/workspace
mkdir -p $workspace_dir

# source directory
source_dir=$KATALON_KATALON_ROOT_DIR/source
if ! [ -d "$source_dir" ]; then
  echo '$source_dir is empty'
  exit 1;
fi

# project source code
project_dir=/tmp/katalon_execute/project
mkdir -p $project_dir

cp -r $source_dir/* $project_dir

# create .classpath if not exist
touch $project_dir/.classpath || exit

# To list project content
echo "Project content:"
ls -la $project_dir

# create report directory
report_dir=$KATALON_KATALON_ROOT_DIR/report
if [ ! -d $report_dir ]; then
    report_dir="$KATALON_KATALON_ROOT_DIR/source/report-$(date '+%Y%m%d%H%M%S')"
    mkdir -p $report_dir
fi

# build command line
args=("$KATALON_KATALON_INSTALL_DIR/katalon" "$@")
args+=("-runMode=console")
args+=("-reportFolder=$report_dir")
args+=("-projectPath=$project_dir")

cd $workspace_dir
xvfb-run -s "-screen 0 $DISPLAY_CONFIGURATION" "${args[@]}"
ret_code=$?

echo "Test finished and return code: $ret_code"
exit $ret_code
