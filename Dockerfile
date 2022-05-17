#---------------------------------------------------------------------------
# Dockefile to build Docker Image of Python3.9 + pip3.9 running on Ubuntu 16.04
#
# Made by Alexander Kornev  May-2022
#---------------------------------------------------------------------------

FROM ubuntu:16.04

RUN apt -y update && apt -y install build-essential checkinstall python3-tk wget tar 

RUN apt -y install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev openssl

RUN wget https://www.python.org/ftp/python/3.9.12/Python-3.9.12.tgz && \
	tar xzf Python-3.9.12.tgz && \
	cd Python-3.9.12 && \
	./configure --prefix=/home/user/sources/compiled/python3.9_dev --with-ensurepip=install && sleep 4 && \
	./configure --enable-optimizations && \
	make && \
	make install

RUN cp /usr/local/bin/python3.9* /usr/bin/ && cp /usr/local/bin/pip3.9* /usr/bin/ && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1 && \
	update-alternatives --config python && \
	update-alternatives --install /usr/bin/pip pip /usr/bin/pip3.9 1 && \
	update-alternatives --config pip && \
	python -V && \
	pip -V

#CMD ["python", "-V"]
#CMD ["pip", "-V"] 
