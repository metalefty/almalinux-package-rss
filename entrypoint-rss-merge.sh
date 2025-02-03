#!/bin/bash

RELVERS="9 8"
KITTEN_VERS="10"

for v in $RELVERS
do
	./rss-merge.rb \
		-t "AlmaLinux ${v} recent packages (everything-source)" \
		-d "AlmaLinux ${v} recent packages (everything-source)" \
		-l https://almalinux.org/ \
		-- $(find output -type f -name almalinux-${v}-\*.rss -regextype egrep -not -regex '.*everything.*') \
		> output/almalinux-${v}-everything-source.rss
done

for v in $KITTEN_VERS
do
	./rss-merge.rb \
		-t "AlmaLinux Kitten ${v} recent packages (everything-source)" \
		-d "AlmaLinux Kitten ${v} recent packages (everything-source)" \
		-l https://almalinux.org/ \
		-- $(find output -type f -name almalinux-kitten-${v}-\*.rss -regextype egrep -not -regex '.*everything.*') \
		> output/almalinux-kitten-${v}-everything-source.rss
done
