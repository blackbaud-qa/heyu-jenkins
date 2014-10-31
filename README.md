heyu-jenkins
============

About
-----
Heyu Jenkins is how the Peer to Peer team is keeping track of their smoke tests. Currently, it uses the jenkins_api_client to read off of the views.

How to use
-----------
To use this, you will need to have X10 components. We currently have a IBM Home Director (HD11). After everything is plugged in, it is time to install Heyu. I found this site useful http://x10linux.blogspot.com/2012/08/installing-heyu-on-raspberry-pi.html

### Heyu Installation
check serial adaptor your controller is plugged into. Use ttyS[01234] or ttyUSB[1234] to see what you have
```
  ls -l /dev/ttyS0
  crwxrwxrwx 1 root dialout 4, 64 Oct 30 15:03 /dev/ttyS0
```
Download the Heyu source pack
```
  wget http://heyu.org/download/heyu-2.10.tar.gz
  tar xf heyu-2.10.tar.gz
  cd heyu-2.10
```
Build Heyu
```
  sh ./Configure
  make
  ...
  sudo make install
  ...
  To which port is the CM11 attached? /dev/ttyS0
```

Play Around with Heyu
```
  heyu on a1
  heyu off a1
```

We run the smoke.sh script every day at 8:00 am
