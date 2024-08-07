#!/bin/bash

RELVERS="9 8"

for v in $RELVERS
do
	./rss-merge.rb \
		-t "AlmaLinux ${v} recent packages (everything-source)" \
		-d "AlmaLinux ${v} recent packages (everything-source)" \
		-l https://almalinux.org/ \
		-- $(find output -type f -name almalinux-${v}-\*.rss -regextype egrep -not -regex '.*everything.*') \
		> output/almalinux-${v}-everything-source.rss
done
