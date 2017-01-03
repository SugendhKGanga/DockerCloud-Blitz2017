#!/bin/bash
python /opt/tracsetup/setup.py install
tracd --port 8098 /opt/test
