#!/bin/zsh
destinations=( "212.78.225.69" "10.168.12.2" "4.51.250.240" "212.78.225.69" )
gw=10.2.2.200
      
for dst in $destinations
do
  sudo route add -net $dst/24 $gw
done
