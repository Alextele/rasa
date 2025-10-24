FROM python:3.10

WORKDIR /app

# Системные зависимости для сборки Rasa
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    python3-dev \
    libffi-dev \
    libssl-dev \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Копируем зависимости
COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Проверяем, что rasa установлена
RUN rasa --version

# Копируем весь проект
COPY . .

EXPOSE 5005

# Запуск Rasa API
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]
