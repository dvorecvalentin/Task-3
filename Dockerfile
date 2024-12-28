# Базовый образ для Node.js
FROM node:18

# Установка Python
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Установим рабочую директорию
WORKDIR /app

# Копируем файлы для Node.js
COPY package*.json ./

# Устанавливаем зависимости Node.js
RUN npm install

# Копируем файлы Python и другие исходники
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Копируем всё остальное
COPY . .

# Экспортируем порт приложения
EXPOSE 3000

# Указываем команду запуска
CMD ["npm", "start"]
