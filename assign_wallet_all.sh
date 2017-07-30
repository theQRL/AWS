QRL_HOME=/home/pete/QRL_HOME

inputfile="wallet_ip"
while read -r line
do

line=( $line )
ip=${line[0]}
node=${line[1])}
mnemonic=${line[@]:2}

ssh centos@$ip -o "StrictHostKeyChecking no" -i key/QRL.pem "
cd QRL
echo '$mnemonic' > mnemonic
"

echo "Name read from file - $ip $node $mnemonic"
done < "$inputfile"

