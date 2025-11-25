echo "======"
echo " server performance "
echo "======"

echo "OS Version "
lsb_release -a 2>/dev/null || cat /etc/os-release
echo ""

echo "System Uptime:"
uptime -p 
echo ""

echo "Load Average"
uptime | awk -F'Load average:' '{print $2}'
echo ""

echo "Logged in users:"
who 
echo ""

echo "Total cpu usage"
top -bn1 | grep "Cpu(s)"
echo ""

echo "memory usage:"
free -h
echo ""

echo "memory usage percentage"
free | awk '/Mem/{printf("used: %.2f%%\n",$3/$2 * 100.0)}'
echo ""

echo "Disk usage percentage"
df / | awk 'NR==2 {print "Used: "$5}'
echo ""

echo "top 5 process by cpu :"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu |head -n 6
echo ""

if [ -f /var/log/auth.log ]; then
    echo "failed login attempts :"
    grep "failed" /var/log/auth.log | wc -l
    echo " "
fi 

echo "============"
echo " end "
echo "============" 
