FROM node:alpine as builder

WORKDIR /app

RUN npm i -g @angular/cli

COPY package.json .
RUN npm install

COPY . .
RUN ng build --prod

FROM nginx

COPY --from=builder /app/dist /usr/share/nginx/html

