.DEFAULT_TAGET := help

help:
	@echo "make all:	Setup and enable timers to generate RSS feed periodically"

install:
	mkdir -p ~/.config/systemd/user
	cp alpr-{rsync,generate@}.{timer,service} ~/.config/systemd/user
	cp alpr-rss-merge.service ~/.config/systemd/user
	make daemon-reload

uninstall:
	rm -f ~/.config/systemd/user/alpr-{rsync,generate@}.{timer,service}
	rm -f ~/.config/systemd/user/alpr-rss-merge.service
	make daemon-reload

daemon-reload:
	systemctl --user daemon-reload

enable: install 
	systemctl --user enable alpr-rsync.timer alpr-rss-merge.service
	systemctl --user enable \
		alpr-generate@8.timer \
		alpr-generate@9.timer \
		alpr-generate@10.timer \
		alpr-generate@10-kitten.timer

disable:
	systemctl --user disable \
		alpr-rsync.timer 
		alpr-rss-merge.service \
		alpr-generate@8.timer \
		alpr-generate@9.timer  \
		alpr-generate@10.timer  \
		alpr-generate@10-kitten.timer 

all: install enable
