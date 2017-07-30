for ip in `cat aws_ips`
do

ssh centos@$ip -o "StrictHostKeyChecking no" -i key/QRL.pem "
ps -ef | grep '[p]ython test.py' | awk '{print \$2}' | xargs kill
"

done
