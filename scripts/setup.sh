#!/bin/bash

# Run updates
DEBIAN_FRONTEND=noninteractive; 
apt-get -y remove grub-pc
sudo apt-get -o Dpkg::Options::="--force-confnew" -y update;
sudo apt-get -o Dpkg::Options::="--force-confnew" -y upgrade;
sudo apt-get install  -o Dpkg::Options::="--force-confnew" -y curl python python-dev;

# Install conda
which conda || {
	CONDA=Miniconda2-latest-Linux-x86_64.sh
	curl -sLO https://repo.continuum.io/miniconda/$CONDA;
	chmod +x ./$CONDA;
	./$CONDA -b -p ./miniconda2;
	rm ./$CONDA;
	echo export PATH=$PATH:./miniconda2/bin >> /home/vagrant/.bashrc;
	echo source activate pyceratOpsRecs >> /home/vagrant/.bashrc;
}
