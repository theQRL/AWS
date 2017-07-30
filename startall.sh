for ip in `cat aws_ips`
do

ssh centos@$ip -o "StrictHostKeyChecking no" -i key/QRL.pem "
cd /home/centos/QRL
screen -d QRL
screen -S QRL -p 0 -X stuff 'exit\\n'
screen -dmS QRL

screen -S QRL -p 0 -X stuff 'python main.py\\n'
"

done
