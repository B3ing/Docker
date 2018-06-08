#Création de l'image Ubuntu accès SSH avec un /home exporté et définir un utilisateur pour chaque étudiant.

FROM aveylon/projet_b3_docker:ubuntu1804


# Don't start any optional services except for the few we need.
RUN find /etc/systemd/system \
    /lib/systemd/system \
    -path '*.wants/*' \
    -not -name '*journald*' \
    -not -name '*systemd-tmpfiles*' \
    -not -name '*systemd-user-sessions*' \
-exec rm \{} \;

#Installation du serveur SSH
RUN apt update &&\
    apt-get install -y systemd openssh-server  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY createuser.sh /sbin/
COPY createuser.service /etc/systemd/system/
RUN ln -s /etc/systemd/system/createuser.service /etc/systemd/system/multi-user.target.wants/

#RUN systemctl set-default multi-user.target

RUN sed -i 's/\(PermitRootLogin\) prohibit-password/\1 yes/' /etc/ssh/sshd_config

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 22

CMD ["/lib/systemd/systemd" , "--system"]
