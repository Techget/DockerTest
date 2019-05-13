# for prod environment

FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install

COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
# for nodejs, the results in /app/build is what going to be needed when try to run the server
