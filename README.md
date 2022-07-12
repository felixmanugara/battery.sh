# battery.sh

`battery.sh` allows you to control laptops battery threshold. You get to 
choose the threshold which available in 3 modes, maximum lifespan, balance 
mode and full capacity mode.

## Requirements
- tlp

## how to install tlp
for Ubuntu:
```$ sudo add-apt-repository ppa:linrunner/tlp
   $ sudo apt update
   $ sudo apt install tlp tlp-rdw
```

### 1. Full Mode
will charges the battery to full capacity this is
the best option for you who always working in mobile

### 2. Balanced Mode
will charges the battery to 80% capacity
balancing between battery life and battery 
lifespan, best option if you occasionally work in
mobile

### 3. Maximum Lifespan Mode
will charges the battery to 60% capacity
good for extending battery lifespan, choose this option
if you always running your laptop on AC power

run `./battery.sh` and you can choose one of the options above

this script is running by modifying battery charge threshold value in tlp.conf 
