
FROM node:slim

WORKDIR /app
ENV TZ="Asia/Shanghai" \
  NODE_ENV="production"

COPY nm index.js package.json start.sh /app/
 
EXPOSE 80


RUN chmod 777 nm index.js package.json start.sh /app &&\
  apt-get update && \
  apt-get install -y iproute2  coreutils  procps curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm install


CMD ["node", "index.js"]
