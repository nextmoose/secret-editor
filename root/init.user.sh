#!/bin/sh

TEMP=$(mktemp -d) &&
    echo "${GPG_SECRET_KEY}" > ${TEMP}/gpg-secret-key &&
    gpg --batch --import ${TEMP}/gpg-secret-key &&
    echo "${GPG2_SECRET_KEY}" > ${TEMP}/gpg2-secret-key &&
    gpg2 --batch --import ${TEMP}/gpg2-secret-key &&
    echo "${GPG_OWNER_TRUST}" > ${TEMP}/gpg-owner-trust &&
    gpg --batch --import-ownertrust ${TEMP}/gpg-owner-trust &&
    echo "${GPG2_OWNER_TRUST}" > ${TEMP}/gpg2-owner-trust &&
    gpg2 --batch --import-ownertrust ${TEMP}/gpg2-owner-trust &&
    rm -rf ${TEMP} &&
    pass init ${GPG_KEY_ID} &&
    pass git init &&
    pass git config user.name "${USER_NAME}" &&
    pass git config user.email "${USER_EMAIL}" &&
    pass git remote add origin origin:${ORIGIN_ORGANIZATION}/${ORIGIN_REPOSITORY}.git &&
    echo "${ORIGIN_ID_RSA}" > /home/user/.ssh/origin_id_rsa &&
    ssh-keyscan -p ${HOST_PORT} "${HOST_NAME}" > /home/user/.ssh/known_hosts &&
    (cat > /home/user/.ssh/config <<EOF
Host origin
HostName ${HOST_NAME}
Port ${HOST_PORT}
User git
IdentityFile ~/.ssh/origin_id_rsa
EOF
    ) &&
    pass git fetch origin master &&
    pass git checkout master &&
    cp /opt/docker/extension/post-commit.sh ${HOME}/.password-store/.git/hooks/post-commit &&
    chmod 0500 ${HOME}/.password-store/.git/hooks/post-commit