# 🐳 Stagehand API Dockerfile для Railway

# Выкарыстоўваем афіцыйны Node.js вобраз
FROM node:18

# Стварыць рабочую дырэкторыю
WORKDIR /app

# Капіруем файл package.json і package-lock.json (калі ёсць)
COPY package*.json ./

# Усталёўваем залежнасці
RUN npm install

# Капіруем увесь праект
COPY . .

# Будаваць (калі Stagehand мае TS -> JS зборку)
RUN npm run build || true

# Адкрываем порт 3000 для Railway
EXPOSE 3000

# Каманда запуску API-сервера
CMD ["npx", "tsx", "api.ts"]
