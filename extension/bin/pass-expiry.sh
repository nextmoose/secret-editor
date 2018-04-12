#!/bin/sh

NOW=$(date +%s) &&
    pass git ls-tree -r --name-only HEAD | grep ".gpg\$" | while read FILE
    do
        PASSWORD_AUTHOR_DATE=$(pass git log -1 --format=%at -- ${FILE}) &&
            PASSWORD_AGE=$((${NOW}-${PASSWORD_AUTHOR_DATE})) &&
            PASSWORD_AGE_LENGTH=${#PASSWORD_LENGTH} &&
            PASSWORD_LENGTH=$(pass show ${FILE%.*} | wc --bytes) &&
            PASSWORD_LENGTH_LENGTH=${#PASSWORD_LENGTH} &&
            echo ${PASSWORD_LENGTH_LENGTH} ${PASSWORD_AGE_LENGTH} ${PASSWORD_LENGTH} $(date --date @${PASSWORD_AUTHOR_DATE} +%Y-%b-%d) ${FILE%.*}
    done | sort -nk 2 | sort -rnk 1