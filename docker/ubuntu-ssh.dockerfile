FROM nestybox/ubuntu-bionic-systemd-docker:latest

RUN apt update && apt install  openssh-server sudo python3 -y
RUN  echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys
RUN service ssh restart
EXPOSE 22
# CMD ["/usr/sbin/sshd","-D"]