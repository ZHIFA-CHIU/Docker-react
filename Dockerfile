FROM node:18-alpine as builder

WORKDIR /home/zhifaq/prod

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /home/zhifaq/prod/build /usr/share/nginx/html