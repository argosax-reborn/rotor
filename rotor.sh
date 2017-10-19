#!/bin/bash
#apt-get install tor lsof -y --force-yes
NAME="Rotor Daemon"
killall tor
mv /etc/tor/torrc /etc/tor/torrc.bak
mv /etc/proxychains.conf /etc/proxychains.conf.bak
cp resources/proxychains.conf /etc/
cp resources/torrc* /etc/tor/
tmux kill-session -t "$NAME"
tmux new-session -s "$NAME" -n "Tor daemons" -d
#tmux new-window -s "vpnwall.xyz"
for i in $(seq 0 3);
do
	tmux new-window -n "Tor daemon n°$i"
	echo "Launching Tor instance..."
	echo "Tor$i on port 905$i"
	tmux send -t "Tor daemon n°$i" "tor -f /etc/tor/torrc.$i" ENTER
done
echo "10 Tor instances created from port 9050 to 9053"
echo "To kill those daemons, use magic !!!"
echo "No, just kidding ! killall tor"
lsof -i
tmux atta -t "$NAME"
