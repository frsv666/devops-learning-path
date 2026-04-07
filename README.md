# 🚀 DevOps Learning Path

> Мой персональный roadmap для изучения DevOps-инжиниринга.  
> Отмечаю прогресс прямо здесь — по мере изучения меняю `[ ]` на `[x]`.

---

## Фаза 1 — Основы
> Linux · Сеть · Git · Скриптинг

### Linux и командная строка
- [ ] Файловая система: `/etc`, `/var`, `/home`, `/proc`
- [ ] Процессы: `ps`, `top`, `htop`, `kill`
- [ ] Права доступа: `chmod`, `chown`, `sudo`
- [ ] Systemd: `systemctl`, `journalctl`
- [ ] SSH: ключи, `~/.ssh/config`, `scp`
- [ ] Cron и crontab
- [ ] Архивы: `tar`, `gzip`, `zip`

### Сети
- [ ] Модель TCP/IP, OSI
- [ ] DNS: A, CNAME, MX записи, `dig`, `nslookup`
- [ ] HTTP/HTTPS: методы, коды ответов, заголовки
- [ ] Firewall: `iptables`, `ufw`
- [ ] Балансировщики нагрузки (концепция)
- [ ] VPN, proxy (концепция)

### Git
- [ ] Базовые команды: `init`, `add`, `commit`, `push`, `pull`
- [ ] Ветки: `branch`, `checkout`, `merge`, `rebase`
- [ ] Pull Request workflow
- [ ] `.gitignore`
- [ ] Теги и релизы

### Скриптинг
- [ ] Bash: переменные, условия, циклы, функции
- [ ] Bash: работа с файлами, строками, аргументами
- [ ] Python: базовый синтаксис
- [ ] Python: работа с файлами и API (`requests`, `json`)

---

## Фаза 2 — Контейнеры и IaC
> Docker · Terraform · Ansible

### Docker
- [ ] Образы и контейнеры: `run`, `build`, `push`, `pull`
- [ ] Написание `Dockerfile`
- [ ] `docker-compose`: сервисы, volumes, networks
- [ ] Реестры: Docker Hub, GitHub Container Registry
- [ ] Multi-stage builds
- [ ] Оптимизация образов

### Terraform
- [ ] Установка и первый `terraform init`
- [ ] Провайдеры (AWS, GCP, etc.)
- [ ] Ресурсы и data sources
- [ ] State файл и remote backend
- [ ] Переменные и outputs
- [ ] Модули

### Ansible
- [ ] Inventory файлы
- [ ] Ad-hoc команды
- [ ] Playbooks и tasks
- [ ] Roles и структура проекта
- [ ] Idempotency — что это и почему важно
- [ ] Ansible Vault для секретов

---

## Фаза 3 — CI/CD и облако
> GitLab CI / GitHub Actions · AWS · Kubernetes

### CI/CD
- [ ] Концепция: build → test → deploy
- [ ] GitHub Actions: workflow, jobs, steps, secrets
- [ ] GitLab CI: `.gitlab-ci.yml`, stages, runners
- [ ] Артефакты сборки
- [ ] Docker в CI/CD пайплайне
- [ ] Деплой через CI/CD

### Облако (AWS)
- [ ] IAM: пользователи, роли, политики
- [ ] EC2: инстансы, ключи, security groups
- [ ] S3: бакеты, политики, статический хостинг
- [ ] VPC: подсети, routing, NAT
- [ ] RDS: управляемые базы данных
- [ ] CloudWatch: логи и метрики

### Kubernetes
- [ ] Архитектура: control plane, worker nodes
- [ ] Pod, ReplicaSet, Deployment
- [ ] Service: ClusterIP, NodePort, LoadBalancer
- [ ] ConfigMap и Secret
- [ ] Ingress и Ingress Controller
- [ ] Namespace
- [ ] Helm: charts, values, release
- [ ] `kubectl` — основные команды

---

## Фаза 4 — Мониторинг и безопасность
> Prometheus · Grafana · DevSecOps

### Мониторинг
- [ ] Prometheus: метрики, exporters, PromQL
- [ ] Grafana: дашборды, datasources, алерты
- [ ] Loki: агрегация логов
- [ ] ELK Stack (Elasticsearch, Logstash, Kibana) — базово
- [ ] Настройка алертов и on-call

### Безопасность (DevSecOps)
- [ ] HashiCorp Vault: хранение секретов
- [ ] AWS Secrets Manager
- [ ] RBAC в Kubernetes
- [ ] Принцип least privilege
- [ ] Сканирование образов: Trivy, Snyk
- [ ] SAST/DAST в CI/CD пайплайне
- [ ] Подпись образов (cosign)

---

## Фаза 5 — Продвинутый уровень
> GitOps · SRE · Platform Engineering

### GitOps
- [ ] Концепция: Git как единый source of truth
- [ ] ArgoCD: установка, приложения, sync
- [ ] Flux: базовая конфигурация
- [ ] Разница GitOps vs традиционный CI/CD

### SRE практики
- [ ] SLI, SLO, SLA — определения и примеры
- [ ] Error budget
- [ ] Toil и как его сокращать
- [ ] Postmortem без обвинений (blameless)
- [ ] Capacity planning
- [ ] Chaos Engineering (концепция)

### Platform Engineering
- [ ] Internal Developer Platform (IDP) — концепция
- [ ] Backstage: установка и плагины
- [ ] Crossplane: инфраструктура через k8s
- [ ] Self-service инфраструктура

---

## 📚 Ресурсы

| Тема | Ресурс |
|------|--------|
| Общий roadmap | [roadmap.sh/devops](https://roadmap.sh/devops) |
| Linux | [Linux Journey](https://linuxjourney.com/) |
| Git | [Pro Git Book](https://git-scm.com/book/ru/v2) |
| Docker | [Play with Docker](https://labs.play-with-docker.com/) |
| Kubernetes | [Kubernetes Docs](https://kubernetes.io/ru/docs/home/) |
| Terraform | [HashiCorp Learn](https://developer.hashicorp.com/terraform/tutorials) |
| AWS | [AWS Free Tier](https://aws.amazon.com/free/) |
| Книга | The Phoenix Project |
| Книга | The DevOps Handbook |

---

## 📝 Заметки и конспекты

> Здесь буду оставлять полезные команды и находки по ходу обучения.

### Полезные команды Linux
```bash
# Посмотреть все запущенные процессы
ps aux

# Найти процесс по имени
ps aux | grep nginx

# Посмотреть открытые порты
ss -tulnp
```

### Полезные команды Docker
```bash
# Запустить контейнер интерактивно
docker run -it ubuntu bash

# Посмотреть все контейнеры (включая остановленные)
docker ps -a

# Почистить неиспользуемые образы
docker image prune
```

---

*Начато: 2025 · Обновляется по мере изучения*
