FROM node:14-alpine

WORKDIR /app

COPY package.json .

RUN npm install -g nodemon

RUN yarn install

EXPOSE 3000

CMD ["yarn", "serve"]