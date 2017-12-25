#!/bin/sh

while [ ${#} -gt 0 ]
do
    case ${1} in
        --comment)
            COMMENT="${2}" &&
                shift 2
        ;;
        --pass-name)
            PASS_NAME="${2}" &&
                shift 2
        ;;
        *)
            echo Unknown Option &&
                echo ${0} &&
                echo ${@} &&
                exit 64
        ;;
    esac
done &&
    if [ -z "${COMMENT}" ]
    then
        echo Missing COMMENT &&
            exit 65
    fi &&
    if [ -z "${PASS_NAME}" ]
    then
        echo Missing PASS_NAME &&
            exit 66
    fi &&
    TEMP=$(mktemp) &&
    rm -f ${TEMP} &&
    ssh-keygen -f ${TEMP} -C "${COMMENT}" -P "" &&
    cat ${TEMP} | pass insert --multiline ${PASS_NAME}/private &&
    cat ${TEMP}.pub | pass insert --multiline ${PASS_NAME}/public &&
    rm -f ${TEMP}