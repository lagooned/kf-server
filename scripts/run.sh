#!/bin/bash

read -p "Steam Username: " USERNAME
read -s -p "Steam Password: " PASSWORD && echo

/home/steam/steamcmd/steamcmd.sh +login $USERNAME $PASSWORD +force_install_dir /kf +app_update 215360 validate +quit

set -x

sed -i s/AdminPassword=.*/AdminPassword="${KF_PASS}"/g /kf/System/Default.ini
sed -i s/GamePassword=.*/GamePassword="${KF_GAMEPASS}"/g /kf/System/Default.ini
sed -i s/AdminName=.*$/AdminName="${KF_LOGIN}"/g /kf/System/Default.ini
sed -i s/ServerName=.*$/ServerName="${KF_SERVER_NAME}"/g /kf/System/Default.ini
sed -i s/AdminEmail=.*$/AdminEmail="${KF_MAIL}"/g /kf/System/Default.ini
sed -i s/KFGameLength=.*$/KFGameLength="${KF_GAME_LENGTH}"/g /kf/System/Default.ini
sed -i s/GameDifficulty=.*$/GameDifficulty="${KF_DIFFICULTY}"/g /kf/System/Default.ini
sed -i s/CharSet="iso-8859-1"/CharSet="utf-8"/g /kf/System/UWeb.int

set +x

cd /kf/System && ./ucc-bin server KF-BioticsLab.rom?game=KFmod.KFGameType?VACSecured=true -nohomedir ini=Default.ini
