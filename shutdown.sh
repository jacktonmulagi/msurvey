#!/bin/sh
WORK_DIR={$PWD}
SERVICE_NAME=msurvey
PATH_TO_JAR=${WORK_DIR}/msurvey.jar
PID_PATH_NAME=/tmp/msurvey-pid
JAVA_OPTS="-Dlogback.configurationFile=${WORK_DIR}/logback.xml"
export JAVA_OPTS

if [ -f $PID_PATH_NAME ]; then
    PID=$(cat $PID_PATH_NAME);
    echo "$SERVICE_NAME stoping ...";
    kill $PID;
    echo "$SERVICE_NAME stopped ...";
    rm $PID_PATH_NAME
else
    echo "$SERVICE_NAME is not running ...";
fi
