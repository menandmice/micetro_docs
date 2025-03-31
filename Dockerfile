FROM nginx:alpine

COPY ./build/html/ /usr/share/nginx/html/version/

EXPOSE 80