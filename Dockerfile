# Stage 1 - Install dependences
FROM node:18-alpine as build

WORKDIR /home/stages/build

COPY ./package.json pnpm-lock.yaml ./

RUN npm i

COPY . .

RUN npm run build

# Stage 2 - Running app
FROM node:18-alpine as running

ARG NODE_ENV=production
ARG PORT=3333

WORKDIR /usr/src/app

RUN npm install pm2 -g

COPY --from=build /home/stages/build .

CMD ["pm2", "start", "ecosystem.config.js"]