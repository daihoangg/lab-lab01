FROM nginx:latest

EXPOSE 8000
LABEL version='1.0'
WORKDIR /app
COPY ./source/ /usr/share/nginx/html/

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
