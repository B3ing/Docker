# /bin/bash
#Verifie si le repertoir exist
[ "$(ls /home/)" == "" ] && exit 1
getent passwd $(ls /home)
#Verifie que l'utilisateur n'existe pas
[ "$(echo $?)" == "0" ] && exit 0

#Création utilisateur
adduser --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --no-create-home --disabled-password --home /home/$(ls /home/) \
--uid $(ls -ln /home/ | awk '{print $3}') $(ls /home)

mypass="$(cat /home/$(ls /home)/initpasswd)"
echo $(ls /home):$mypass | chpasswd
