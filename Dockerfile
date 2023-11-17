# Stage 1 - Install dependences
FROM node:18-slim as build

USER node

WORKDIR /home/stages/build

COPY --chown=node:node ./package.json pnpm-lock.yaml ./

RUN npm i

COPY --chown=node:node . .

RUN npm run build

# Stage 2 - Running app
FROM node:18-slim as running

RUN npm install pm2 -g

USER node

ARG NODE_ENV=production
ARG PORT=3333

WORKDIR /usr/src/app

COPY --from=build /home/stages/build .

EXPOSE 3333

CMD ["pm2", "start", "ecosystem.config.js"]