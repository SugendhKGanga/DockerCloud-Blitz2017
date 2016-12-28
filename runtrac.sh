#!/bin/bash
docker -H tcp://localhost:2375 exec -it trac-app /opt/test.sh
