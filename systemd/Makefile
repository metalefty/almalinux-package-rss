.DEFAULT_TAGET := help

help:
	@echo "make all:	Setup and enable timers to generate RSS feed periodically"

install:
	mkdir -p ~/.config/systemd/user
	cp alpr-{rsync,generate@}.{timer,service} ~/.config/systemd/user
	make daemon-reload

uninstall:
	rm -f ~/.config/systemd/user/alpr-{rsync,generate@}.{timer,service}
	make daemon-reload

daemon-reload:
	systemctl --user daemon-reload

enable: install 
	systemctl --user enable alpr-rsync.timer alpr-generate@8.timer alpr-generate@9.timer

disable:
	systemctl --user enable alpr-rsync.timer alpr-generate@8.timer alpr-generate@9.timer

all: install enable
