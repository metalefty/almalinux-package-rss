#!/bin/bash

REPOS=$(dnf repolist --enablerepo=\* | grep AlmaLinux | grep Source | awk '{print $1}')

dnf --refresh --enablerepo=\*-source --disablerepo=docker\* check-update

for r in $REPOS
do
	source /etc/os-release
	 ./rss.py \
		--filename "output/${ID}-${VERSION_ID%.*}-$r.rss" \
	 	--link ${HOME_URL} \
		--days 30 \
		--title "Most recent updated packages in ${NAME} ${VERSION_ID%.*} ${r}" \
		--description "Most recent updated packages in ${NAME} ${VERSION_ID%.*} ${r}" \
		"${r}"
done
