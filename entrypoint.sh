#!/bin/bash

REPOS=$(dnf repolist --enablerepo=\* | grep AlmaLinux | grep Source | awk '{print $1}')

dnf --refresh --enablerepo=\*-source --disablerepo=docker\* check-update

for r in $REPOS
do
	source /etc/os-release
	 ./rss.py \
		--filename "output/${ID}-${VERSION_ID%.*}-${r#almalinux-}.rss" \
		--link ${HOME_URL} \
		--days 30 \
		--title "${NAME} ${VERSION_ID%.*} recent packages (${r})" \
		--description "${NAME} ${VERSION_ID%.*} recent packages (${r})" \
		"${r}"
done
