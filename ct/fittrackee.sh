#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/fritruc/ProxmoxVE/main/misc/build.func)
# Copyright (c) 2024
# Author:
# License: MIT
# https://github.com/fritruc/ProxmoxVE/raw/main/LICENSE

function header_info {
clear
cat <<"EOF"
___________.__  __ ___________                     __                  
\_   _____/|__|/  |\__    ___/___________    ____ |  | __ ____   ____  
 |    __)  |  \   __\|    |  \_  __ \__  \ _/ ___\|  |/ // __ \_/ __ \ 
 |     \   |  ||  |  |    |   |  | \// __ \\  \___|    <\  ___/\  ___/ 
 \___  /   |__||__|  |____|   |__|  (____  /\___  >__|_ \\___  >\___  >
     \/                                  \/     \/     \/    \/     \/ 
 
EOF
}
header_info
echo -e "Loading..."
APP="FitTrackee"
var_disk="2"
var_cpu="1"
var_ram="512"
var_os="debian"
var_version="12"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=$NEXTID
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
}
function update_script() {
header_info
if [[ ! -d /opt/FitTrackee ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
msg_error "${APP} should be updated via the user interface."
exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${APP} Setup should be reachable by going to the following URL.
         ${BL}http://${IP}:3000${CL} \n"
