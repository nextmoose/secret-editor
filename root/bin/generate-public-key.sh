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
    FILE=$(mktemp) &&
    pass show ${PASS_NAME} > ${FILE} &&
    ssh-keygen -f ${FILE} -y