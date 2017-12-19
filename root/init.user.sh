#!/bin/sh

while [ ${#} -gt 0 ]
do
    case ${1} in
        --gpg-secret-key)
            TEMP=$(mktemp) &&
                echo "${2}" > ${TEMP} &&
                gpg --batch --import ${TEMP} &&
                rm -f ${TEMP}
        ;;
        --gpg-key-id)
            GPG_KEY_ID="${2}" &&
                shift 2
        ;;
        --user-name)
            USER_NAME="${2}" &&
                shift 2
        ;;
        --user-email)
            USER_EMAIL="${2}" &&
                shift 2
        ;;
        --origin-id-rsa)
            echo "${2}" > /home/user/.ssh/origin_id_rsa &&
                shift 2
        ;;
        --origin-organization)
            ORIGIN_ORGANIZATION="${2}" &&
                shift 2
        ;;
        --origin-repository)
            ORIGIN_REPOSITORY="${2}" &&
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
    # WORKDIR=$(mktemp -d) &&
    # echo "${GPG_SECRET_KEY}" > ${WORKDIR}/gpg_secret_key &&
    # gpg --batch --import ${WORKDIR}/gpg_secret_key && 
    # gpg2 --batch --import ${GPG2_SECRET_KEY} && 
    # gpg --batch --import-ownertrust ${GPG_OWNER_TRUST} && 
    # gpg2 --batch --import-ownertrust ${GPG2_OWNER_TRUST} && 
    # pass init ${GPG_KEY_ID} &&
    # pass git init &&
    # pass git config user.name "${USER_NAME}" &&
    # pass git config user.email "${USER_EMAIL}" &&
    # pass git remote add origin origin:${ORIGIN_ORGANIZATION}/${ORIGIN_REPOSITORY}.git &&
    # pass git fetch origin master &&
    # pass git checkout master &&
    # cp /opt/docker/extension/post-commit.sh ${HOME}/.password-store/.git/hooks/post-commit &&
    # chmod 0500 ${HOME}/.password-store/.git/hooks/post-commit &&
    bash