# 📜 Bash

## Основы скрипта

```bash
#!/bin/bash
# Всегда начинай скрипт с shebang

set -e          # завершить скрипт при ошибке
set -u          # ошибка при использовании неопределённой переменной
set -o pipefail # ошибка в pipe не замалчивается
```

## Переменные

```bash
NAME="world"
echo "Hello, $NAME"
echo "Hello, ${NAME}!"     # фигурные скобки для чёткости

# Переменные окружения
echo $HOME
echo $PATH
export MY_VAR="value"      # экспортировать в дочерние процессы
```

## Условия

```bash
if [ "$1" == "start" ]; then
  echo "Starting..."
elif [ "$1" == "stop" ]; then
  echo "Stopping..."
else
  echo "Unknown command"
fi

# Проверки файлов
if [ -f "/etc/nginx/nginx.conf" ]; then
  echo "Config exists"
fi

if [ -d "/var/log/nginx" ]; then
  echo "Log dir exists"
fi
```

## Циклы

```bash
# for
for i in 1 2 3 4 5; do
  echo "Number: $i"
done

# for по файлам
for file in /var/log/*.log; do
  echo "Processing: $file"
done

# while
counter=0
while [ $counter -lt 5 ]; do
  echo "Counter: $counter"
  ((counter++))
done
```

## Функции

```bash
greet() {
  local name=$1        # local — переменная только внутри функции
  echo "Hello, $name!"
}

greet "DevOps"

# Функция с возвращаемым значением
get_timestamp() {
  echo $(date +%Y%m%d_%H%M%S)
}

TS=$(get_timestamp)
echo "Timestamp: $TS"
```

## Аргументы скрипта

```bash
#!/bin/bash
echo "Скрипт: $0"
echo "Первый аргумент: $1"
echo "Второй аргумент: $2"
echo "Все аргументы: $@"
echo "Количество: $#"
```

## Работа со строками

```bash
STR="hello world"
echo ${#STR}           # длина строки: 11
echo ${STR^^}          # HELLO WORLD
echo ${STR// /_}       # hello_world (замена)
echo ${STR:0:5}        # hello (подстрока)
```

## Практический пример — деплой скрипт

```bash
#!/bin/bash
set -euo pipefail

APP_NAME="my-app"
DOCKER_IMAGE="myrepo/${APP_NAME}"
VERSION=${1:-latest}

log() {
  echo "[$(date '+%H:%M:%S')] $1"
}

log "Deploying ${APP_NAME}:${VERSION}..."

docker pull "${DOCKER_IMAGE}:${VERSION}"
docker stop "${APP_NAME}" 2>/dev/null || true
docker rm "${APP_NAME}" 2>/dev/null || true
docker run -d \
  --name "${APP_NAME}" \
  --restart unless-stopped \
  -p 8080:8080 \
  "${DOCKER_IMAGE}:${VERSION}"

log "Done! ${APP_NAME} is running."
```

---
*Последнее обновление: —*
