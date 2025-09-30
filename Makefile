.PHONY: install-apt-packages requirements-for-installing-apt-packages clean link-all

UBUNTU_RELEASE_CODENAME != cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -f2 -d=

requirements-for-installing-apt-packages:
	sudo add-apt-repository "deb https://ppa.launchpadcontent.net/rmescandon/yq/ubuntu $(UBUNTU_RELEASE_CODENAME) main"
	sudo apt install yq

install-apt-packages: requirements-for-installing-apt-packages
	yq eval '.packages[]' apt-package-list.yaml | xargs sudo apt install -y

~/.config/git/ignore:
	ln -s ~/dootFools/.config/git/ignore ~/.config/git/ignore

link-all: ~/.config/git/ignore

clean-links:
	-rm ~/.config/git/ignore
