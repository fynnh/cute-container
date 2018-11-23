FROM debian:stretch

RUN apt-get update && apt-get install -y \
    iputils-ping \
    iproute2 \
    curl \
    sudo \
    pyro4 \
    python3-pip \
 && pip3 install begins \
 && rm -rf /var/lib/apt/lists/* \
 && useradd -m pi \
 && echo 'pi ALL=NOPASSWD: ALL' > /etc/sudoers.d/pi

COPY docker-entrypoint.sh /
USER pi
WORKDIR /home/pi/
ENTRYPOINT ["/docker-entrypoint.sh"]

