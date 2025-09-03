# Используем официальный Node.js образ (LTS)
FROM node:20-bullseye-slim

# Создаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json (если есть)
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install --production

# Копируем весь код в контейнер
COPY . .

# Экспорт переменных окружения через .env (не коммитить .env в репозиторий!)
ENV NODE_ENV=production

# Создаем директорию для данных браузера
RUN mkdir -p /app/lidl-extender-data

# Устанавливаем зависимости для Playwright
RUN npx playwright install --with-deps

# Запуск скрипта при старте контейнера
CMD ["node", "script.js"]
