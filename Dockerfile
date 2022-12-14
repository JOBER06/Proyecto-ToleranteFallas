FROM node:16-buster

WORKDIR /app

COPY build ./build

RUN mkdir -p ./tmp/image
RUN mkdir -p ./tmp/thumb
RUN mkdir -p ./tmp/uploads

COPY package.json ./

RUN npm install --prod

WORKDIR /app/build

EXPOSE 3000

CMD ["node", "app.js"]