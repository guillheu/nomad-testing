FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo -y
RUN  echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]