FROM node:16-alpine

RUN apk add --update nginx

# Create the directories we will need
RUN mkdir -p /var/log/nginx
RUN mkdir -p /var/www/html

# Copy the respective nginx configuration files
COPY nginx.conf /etc/nginx/nginx.conf

# Set the directory we want to run the next commands for
WORKDIR /var/www/html
# Copy our source code into the container
COPY dist .

# make all files belong to the nginx user
RUN chown nginx:nginx /var/www/html

# start nginx and keep the process from backgrounding and the container from quitting
CMD ["nginx", "-g", "daemon off;"]