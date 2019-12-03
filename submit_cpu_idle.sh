#!/bin/bash

interval=10
cpu_avg=`mpstat 1 $interval |tail -n 1 | awk '{print $NF}'`
instance_id=`curl http://169.254.169.254/latest/meta-data/instance-id`
aws cloudwatch put-metric-data --namespace AWS/EC2 --metric-name CPUIdle --dimensions InstanceId=$instance_id --value $cpu_avg --unit Percent
