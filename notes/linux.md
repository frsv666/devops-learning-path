# 🐧 Linux

## Навигация

```bash
pwd                  # текущая директория
ls -la               # список файлов с правами
cd /etc              # перейти в директорию
cd ~                 # перейти в домашнюю
cd -                 # вернуться в предыдущую
find / -name "*.log" # найти файлы по имени
```

## Файлы и директории

```bash
cp file.txt /tmp/         # копировать файл
mv file.txt newname.txt   # переместить / переименовать
rm -rf /tmp/mydir         # удалить директорию рекурсивно
mkdir -p /opt/app/config  # создать директории с родителями
cat file.txt              # вывести содержимое
less file.txt             # постраничный просмотр
tail -f /var/log/syslog   # следить за логом в реальном времени
grep -r "error" /var/log  # найти текст рекурсивно
```

## Права доступа

```bash
chmod 755 script.sh       # rwxr-xr-x
chmod +x script.sh        # добавить право на исполнение
chown user:group file.txt # сменить владельца
sudo command              # выполнить от root
```

## Процессы

```bash
ps aux                    # все процессы
ps aux | grep nginx       # найти процесс
top                       # интерактивный мониторинг
htop                      # улучшенный top
kill -9 1234              # завершить процесс по PID
pkill nginx               # завершить по имени
```

## Сеть

```bash
ip a                      # сетевые интерфейсы и IP
ss -tulnp                 # открытые порты
ping google.com           # проверить связь
curl -I https://google.com # HTTP заголовки ответа
wget https://example.com/file.zip # скачать файл
```

## SSH

```bash
ssh user@192.168.1.10           # подключиться
ssh -i ~/.ssh/mykey user@host   # с ключом
scp file.txt user@host:/tmp/    # скопировать файл на сервер
ssh-keygen -t ed25519           # создать ключевую пару
```

## Systemd

```bash
systemctl status nginx          # статус сервиса
systemctl start nginx           # запустить
systemctl stop nginx            # остановить
systemctl restart nginx         # перезапустить
systemctl enable nginx          # автозапуск при старте
journalctl -u nginx -f          # логи сервиса в реальном времени
journalctl --since "1 hour ago" # логи за последний час
```

## Архивы

```bash
tar -czf archive.tar.gz /mydir  # создать архив gz
tar -xzf archive.tar.gz         # распаковать архив gz
zip -r archive.zip /mydir       # создать zip
unzip archive.zip               # распаковать zip
```

## Полезные однострочники

```bash
# Топ 10 самых больших файлов
du -sh /* 2>/dev/null | sort -rh | head -10

# Сколько места на диске
df -h

# Оперативная память
free -h

# Кто залогинен на сервере
who

# История команд с поиском
history | grep docker
```

---
*Последнее обновление: —*
