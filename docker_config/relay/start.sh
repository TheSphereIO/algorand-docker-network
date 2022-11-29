#!/bin/bash
echo "Removing old node.log file..."
rm -f /root/data/node.log
cp phonebook.json /root/node/phonebook.json
echo "Starting algod as a relay, with this config:"
cat /root/data/config.json
/root/node/goal node start  -d /root/data
/root/node/carpenter -file /root/data/node.log
