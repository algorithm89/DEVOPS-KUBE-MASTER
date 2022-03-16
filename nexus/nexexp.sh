

#!/bin/bash



read -p "please put in your IP: " IP


docker run -d -p 9184:9184 -e NEXUS_HOST=http://$IP:8081 -e NEXUS_USERNAME=admin -e NEXUS_ADMIN_PASSWORD=toor89  ocadotechnology/nexus-exporter
