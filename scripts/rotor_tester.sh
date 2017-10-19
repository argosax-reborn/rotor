#!/bin/bash

for i in $(seq 0 9);
do
	proxy="905$i"
	curl --proxy socks5h://localhost:$proxy ifconfig.co
done
