# Stagehand Dockerfile для Railway

FROM node:18

# Стварыць дырэкторыю для Stagehand
WORKDIR /app

# Капіруем package.json і lock файл
COPY package*.json ./

# Усталёўваем залежнасці
RUN npm install

# Капіруем увесь код праекта
COPY . .

# Будаваць TypeScript-праект (стварыць dist/index.js)
RUN npm run build

# Запускаем Stagehand
CMD ["npm", "start"]
