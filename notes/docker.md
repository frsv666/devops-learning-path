# 🐳 Docker

## Основные команды

```bash
docker ps                        # запущенные контейнеры
docker ps -a                     # все контейнеры
docker images                    # список образов
docker pull nginx                # скачать образ
docker run nginx                 # запустить контейнер
docker run -d nginx              # в фоне
docker run -d -p 8080:80 nginx   # с проброском порта
docker run -it ubuntu bash       # интерактивно
docker stop container_id         # остановить
docker rm container_id           # удалить контейнер
docker rmi nginx                 # удалить образ
```

## Dockerfile

```dockerfile
FROM ubuntu:22.04

# Установить зависимости
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копировать зависимости отдельно (кэширование слоёв)
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Копировать код
COPY . .

# Открыть порт
EXPOSE 8000

# Команда запуска
CMD ["python3", "app.py"]
```

## Сборка и пуш образа

```bash
docker build -t myapp:1.0 .             # собрать образ
docker build -t myapp:1.0 -f Dockerfile.prod . # с другим Dockerfile
docker tag myapp:1.0 username/myapp:1.0 # тег для registry
docker push username/myapp:1.0          # запушить в Docker Hub
```

## Docker Compose

```yaml
# docker-compose.yml
version: '3.8'

services:
  app:
    build: .
    ports:
      - "8000:8000"
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/mydb
    depends_on:
      - db
    volumes:
      - .:/app

  db:
    image: postgres:15
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

```bash
docker-compose up -d             # запустить всё в фоне
docker-compose down              # остановить и удалить контейнеры
docker-compose logs -f app       # логи сервиса
docker-compose exec app bash     # войти в контейнер
docker-compose ps                # статус сервисов
```

## Volumes и Networks

```bash
docker volume create mydata      # создать volume
docker volume ls                 # список volumes
docker network create mynet      # создать сеть
docker network ls                # список сетей
```

## Очистка

```bash
docker system prune              # удалить всё неиспользуемое
docker image prune               # удалить dangling образы
docker container prune           # удалить остановленные контейнеры
```

## Отладка

```bash
docker logs container_id         # логи контейнера
docker logs -f container_id      # следить за логами
docker exec -it container_id bash  # войти в контейнер
docker inspect container_id      # полная информация
docker stats                     # потребление ресурсов
```

---
*Последнее обновление: —*
