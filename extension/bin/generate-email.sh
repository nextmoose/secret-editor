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
        echo Must specify PASS_NAME &&
            exit 65
    fi &&
    echo ${EMAIL_USER_NAME}+$(cat /dev/urandom | tr -dc "A-Z" | fold -w 8 | head -n 1)@${EMAIL_DOMAIN_NAME} | pass insert --multiline ${PASS_NAME}