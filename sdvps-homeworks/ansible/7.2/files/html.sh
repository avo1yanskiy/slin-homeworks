#!/usr/bin/env bash

echo '<html>' > index.html
echo '<title>Netology homework 7.1</title>' >> index.html

echo '<h3>Memory-total</h3>' >> index.html;

cat /proc/meminfo | grep MemTotal >> index.html

echo '<h3>CPU</h3>' >> index.html

lscpu | egrep 'Architecture|CPU\(s\)' >> index.html

echo '<h3>IP Address computer</h3>' >> index.html
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' >> index.html

echo '<h3>HDD</h3>' >> index.html
lsblk | grep disk >> index.html

echo '</html>' >> index.html