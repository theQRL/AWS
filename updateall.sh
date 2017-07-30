QRL_HOME=/home/pete/QRL_HOME

for ip in `cat aws_ips`
do

scp -i key/QRL.pem  $QRL_HOME/* centos@$ip:/home/centos/QRL

done
