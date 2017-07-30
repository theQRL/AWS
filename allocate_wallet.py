import json

filename = "aws_instances.json"
walletfile = "aws_wallet"
aws_ips = "aws_ips"
wallet_ip = "wallet_ip"

with open(filename, 'r') as f:
    data = json.load(f)

with open("wallet_instance.json", "r") as f:
    ordered_wallet = json.load(f)

total_instances = len(data["Reservations"][0]["Instances"])

with open(wallet_ip, 'w') as f:
    for i in range(total_instances):
        ip = data["Reservations"][0]["Instances"][i]["PublicIpAddress"]
        node = data["Reservations"][0]["Instances"][i]["Tags"][0]["Value"]
        node = node.split('-')[1]
        f.write(str(ip)+' '+str(node)+' '+str(ordered_wallet[str(i+1)][1])+'\n')
    
with open(aws_ips, 'w') as f:
    for i in range(total_instances):
        ip = data["Reservations"][0]["Instances"][i]["PublicIpAddress"]
        node = data["Reservations"][0]["Instances"][i]["Tags"][0]["Value"]
        node = node.split('-')[1]
        f.write(str(ip)+'\n')
    
