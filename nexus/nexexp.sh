

#!/bin/bash

docker run -d -p 9184:9184 -e NEXUS_HOST=http://10.1.1.1:8081 -e NEXUS_USERNAME=admin -e NEXUS_ADMIN_PASSWORD=toor89  ocadotechnology/nexus-exporter
