FROM node:15

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

# Copy the rest of the application code to the container
COPY . app.js

USER node 

COPY --chown=node:node . .

ENV PORT=8080

EXPOSE 8080

CMD ["npm","start"]
