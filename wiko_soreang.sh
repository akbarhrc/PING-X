#!/bin/bash

# Daftar nama tempat berdasarkan alamat IP
declare -A tempat
tempat["10.0.0.1"]="server"
tempat["10.0.0.2"]=""
tempat["10.0.0.3"]=""
tempat["10.0.0.4"]=""
tempat["10.0.0.5"]=""
tempat["10.0.0.6"]=""
tempat["10.0.0.7"]=""
tempat["10.0.0.8"]=""

# Warna ANSI escape codes
WarnaHijau="\033[32m"
WarnaMerah="\033[31m"
WarnaReset="\033[0m"

for i in {1..7}
do
  IP="10.0.0.$i"
  ping -c 1 $IP > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    if [ -n "${tempat[$IP]}" ]; then
      echo -e "${WarnaHijau}$IP is up (${tempat[$IP]})${WarnaReset}"
    else
      echo -e "${WarnaHijau}$IP is up (Unknown)${WarnaReset}"
    fi
  else
    if [ -n "${tempat[$IP]}" ]; then
      echo -e "${WarnaMerah}$IP is down (${tempat[$IP]})${WarnaReset}"
    else
      echo -e "${WarnaMerah}$IP is down (Unknown)${WarnaReset}"
    fi
  fi
done
echo

#!/bin/bash
while true
do
./wiko_soreang.sh
sleep 1
done
