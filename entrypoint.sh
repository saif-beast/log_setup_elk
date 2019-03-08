#!/bin/bash

service elasticsearch start
service kibana start
#service logstash start
### Keeps running PID 1 process to hold container from stopping
top
