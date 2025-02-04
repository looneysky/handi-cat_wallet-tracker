# Используем официальный Node.js образ
FROM node:22.13.0

# Устанавливаем pnpm
RUN npm install -i pnpm

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем только package.json и pnpm-lock.yaml, чтобы сначала установить зависимости
COPY package.json pnpm-lock.yaml ./

# Выполняем установку зависимостей с помощью pnpm (с флагом --verbose для диагностики)
RUN pnpm install

# Копируем все файлы проекта
COPY . .

# Открываем порт 3001
EXPOSE 3001

# Запускаем приложение
CMD ["pnpm", "start"]
