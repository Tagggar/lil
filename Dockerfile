FROM node:20-slim

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

ENV BROWSER=chromium

CMD ["node", "script.js"]
