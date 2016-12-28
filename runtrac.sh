#!/bin/bash
docker -H tcp://localhost:2375 exec -i trac-app /opt/test.sh
