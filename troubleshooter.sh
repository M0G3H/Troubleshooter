#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Require root
if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}This script must be run with sudo.${NC}" >&2
  exit 1
fi


echo -e "${BLUE}===================================${NC}"
echo -e "${YELLOW} Welcome To Troubleshooter${NC}"
echo -e "${BLUE}===================================${NC}"
echo -e "${NC}"

echo -e "${BLUE} Attention:${NC}"
echo -e "${GREEN} Green Means Everything Is Good${NC}"
echo -e "${RED} Red Means Something Is Wrong${NC}"
echo -e "${NC}"

echo -e "${YELLOW} Checking Secure Boot...${NC}"
if ! lsmod | grep secure > /dev/null; then
        echo -e "${GREEN} Secure Boot Is Disable${NC}"
else
        echo -e "${RED} Secure Boot Is Enable -> Please Make It Disable${NC}"
fi
echo -e "${NC}"


echo -e "${YELLOW} Checking ko File...${NC}"
if lsmod | grep ko-name > /dev/null; then
        echo -e "${GREEN} KO Load Successfully${NC}"
else
        echo -e "${RED} KO Is Not Loaded${NC}"
fi
echo -e "${NC}"


echo -e "${YELLOW} Checking Servises...${NC}"
#test1-service
if sudo systemctl status test1.service | grep "server is up" > /dev/null; then
	echo -e "${GREEN} test1 Service Is Working Correctly${NC}"
else
	echo -e "${RED} test1 Service Has A Problem${NC}"
	sudo systemctl status test1.service
fi

#test2-service
if sudo systemctl status test2 > /dev/null; then
	echo -e "${GREEN} test2 Service Is Working Correctly${NC}"
else
	echo -e "${RED} test2 Service Has A Problem${NC}"
	sudo systemctl status test2
fi

echo -e "${YELLOW} Checking Server ...${NC}"
#server
if sudo server-status-command | grep '"local-ip": "10.0.0.10", "listen-port": "400"' > /dev/null; then
	echo -e "${GREEN} server Program Is Working Correctly${NC}"
else
	echo -e "${RED} server Program Has A Problem${NC}"
	sudo server-status-command
fi
echo -e "${NC}"

echo -e "${YELLOW} Checking Binaries ...${NC}"
#test1
if test -f /usr/local/bin/test1; then
        echo -e "${GREEN} test1 Binary Exist${NC}"
else
        echo -e "${RED} test1 Binary Is Missing${NC}"
fi

#test2
if test -f /usr/local/bin/test2; then
        echo -e "${GREEN} test2 Binary Exist${NC}"
else
        echo -e "${RED} test2 Binary Is Missing${NC}"
fi

