# Используем минимальный базовый образ Python с Alpine Linux
FROM python:3.11-alpine

# Копируем файл зависимостей и устанавливаем их
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Копируем исходный код приложения в Docker-контейнер
COPY ./main.py /app/main.py

# Задаем рабочую директорию
WORKDIR /app

# Открываем порт 5000, который используется FastAPI
EXPOSE 5000

# Запускаем FastAPI сервер при запуске контейнера
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
