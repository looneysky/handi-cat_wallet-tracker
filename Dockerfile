# Используем официальный Node.js образ
FROM node:22.13.0

# Устанавливаем pnpm
RUN npm install -g pnpm

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и pnpm-lock.yaml для установки зависимостей
COPY package.json pnpm-lock.yaml ./

# Выполняем установку зависимостей с помощью pnpm
RUN pnpm install

# Копируем все файлы проекта
COPY . .

# Открываем порт 3001
EXPOSE 3001

# Запускаем приложение
CMD ["pnpm", "start"]
