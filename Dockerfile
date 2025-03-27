FROM ubuntu:22.04

RUN apt update && \
    apt install -y openssh-server sudo && \
    mkdir /var/run/sshd

COPY create-users.sh /usr/local/bin/create-users.sh
RUN sed -i 's/\r//' /usr/local/bin/create-users.sh && \
    chmod +x /usr/local/bin/create-users.sh

EXPOSE 22

CMD ["/usr/local/bin/create-users.sh"]
