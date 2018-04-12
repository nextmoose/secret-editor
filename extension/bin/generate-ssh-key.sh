#!/bin/sh

while [ ${#} -gt 0 ]
do
    case ${1} in
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
    if [ -z "${PASS_NAME}" ]
    then
        echo Missing PASS_NAME &&
            exit 65
    fi &&
    TEMP=$(mktemp) &&
    rm -f ${TEMP} &&
    ssh-keygen -f ${TEMP} -C "${COMMENT}" -P "" &&
    cat ${TEMP} | pass insert --multiline ${PASS_NAME} &&
    rm -f ${TEMP}