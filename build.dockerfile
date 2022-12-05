FROM node:16-buster

WORKDIR /app

COPY server ./server

RUN mkdir -p ./tmp/image
RUN mkdir -p ./tmp/thumb
RUN mkdir -p ./tmp/uploads

COPY package.json ./
COPY .babelrc ./

RUN yarn install
RUN yarn build
RUN yarn clean-extensions

WORKDIR /app/build

EXPOSE 3000

CMD ["node", "app.js"]