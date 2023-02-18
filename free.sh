#! /usr/bin/bash
mem_tot=$(grep MemTotal /proc/meminfo | awk '{print $2;}')
mem_free=$(grep MemFree /proc/meminfo  | awk '{print $2;}')
mem_used=$(( $mem_tot - $mem_free  ))
sw_tot=$(grep SwapTotal /proc/meminfo | awk '{print $2;}')
sw_free=$(grep SwapFree /proc/meminfo | awk '{print $2;}')
swap_used=$(( $sw_tot - $sw_free ))

for el in MemTotal  MemFree Buffers Cached MemAvailable
do
	info=$(grep $el  /proc/meminfo | awk '{print $2;}')
	echo "${el}:$info"
done 
echo "MemUsed:$mem_used"
echo "SwapTotal:$sw_tot"
echo "SwapFree:$sw_free"
echo "SwapUsed:$swap_used"


