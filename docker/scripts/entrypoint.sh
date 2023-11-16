#!/bin/ash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

cd /home/node/app

npm i
USER node

echo -e "${YELLOW} DEBUG MODE IS ENABLE: $DEBUG ${NC}"

if [ "$DEBUG" = true ] ; then
    echo -e "${RED} Running api on [ DEBUG MODE ]${NC}"
    npm run start:debug
else
    echo -e "${GREEN} Running api on [ DEV MODE ]${NC}"
    npm run start:dev
fi