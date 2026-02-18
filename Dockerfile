# Dockerfile
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости (сначала только requirements для кэширования)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем код приложения
COPY . .

# Указываем порт, который слушает приложение (8181)
EXPOSE 8181

# Команда для запуска приложения
# Используем переменные окружения из файла .env или системы
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]
