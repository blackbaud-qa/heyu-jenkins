#!/bin/bash
export TERM=xterm
# we have to cd into the bin directory
cd /home/convio/Documents/heyu-jenkins/bin

# number of seconds to run the script for
run_for=36000

# number of seconds between each poll
poll_every=10

# cmd to get the status and update the devices
ruby_cmd="bundle exec ruby update_device.rb"

# cmd to run the above every $poll_every seconds
watch_cmd="watch -n $poll_every $ruby_cmd"

# cmd to stop updating the devices after a period of time passes
cmd="timelimit -t$run_for -T$run_for $watch_cmd"

# execute it
$cmd

# after it finishes, we need to turn off the lights
turn_off="heyu off a2"
$turn_off
