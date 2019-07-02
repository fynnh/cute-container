FROM debian:stretch

RUN apt-get update && apt-get install -y \
    iputils-ping \
    iproute2 \
    curl \
    sudo \
    python3-pip \
    netcat \
    libzbar0 \
 && rm -rf /var/lib/apt/lists/* \
 && useradd -m pi \
 && echo 'pi ALL=NOPASSWD: ALL' > /etc/sudoers.d/pi

RUN pip3 install begins pyro4 numpy portalocker scipy pillow pyzbar netifaces jsonpickle pathos
COPY docker-entrypoint.sh /
USER pi
WORKDIR /home/pi/
ENTRYPOINT ["/docker-entrypoint.sh"]

