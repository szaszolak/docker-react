FROM node:alpine AS builder

WORKDIR /app

COPY package.json package.json

RUN npm install --silent

COPY . . 

RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/build/ /usr/share/nginx/html
