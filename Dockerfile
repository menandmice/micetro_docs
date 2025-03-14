FROM nginx:alpine

COPY . /usr/share/nginx/html/version

EXPOSE 80