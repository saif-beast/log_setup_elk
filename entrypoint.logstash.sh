#!/bin/bash

service logstash start
### Keeps running PID 1 process to hold container from stopping
tail -f /dev/null
