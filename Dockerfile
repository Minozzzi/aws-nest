# Stage 1 - Install dependences
FROM node:14-slim as build

WORKDIR /home/stages/build

COPY ./package.json pnpm-lock.yaml ./

RUN pnpm i

COPY . .

RUN pnpm build

# Stage 2 - Running app
FROM node:14-slim as running

ARG NODE_ENV=production
ARG PORT=3333

WORKDIR /usr/src/app

RUN npm install pm2 -g

COPY --from=build /home/stages/build .

CMD ["pm2", "start", "ecosystem.config.js"]