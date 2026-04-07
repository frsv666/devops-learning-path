# ⚙️ CI/CD

## GitHub Actions

### Базовый workflow

```yaml
# .github/workflows/deploy.yml
name: Build and Deploy

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Set up Docker
      uses: docker/setup-buildx-action@v3

    - name: Login to Docker Hub
      uses: docker/login-action@v3
      with:
        username: ${{ secrets.DOCKERHUB_USERNAME }}
        password: ${{ secrets.DOCKERHUB_TOKEN }}

    - name: Build and push
      uses: docker/build-push-action@v5
      with:
        push: true
        tags: myuser/myapp:${{ github.sha }}
```

### Переменные и секреты

```yaml
env:
  APP_ENV: production           # переменная на уровне workflow

jobs:
  deploy:
    env:
      DB_HOST: localhost         # переменная на уровне job
    steps:
    - name: Use secret
      run: echo "${{ secrets.API_KEY }}"  # секрет из Settings → Secrets
```

## GitLab CI

### Базовый .gitlab-ci.yml

```yaml
stages:
  - build
  - test
  - deploy

variables:
  IMAGE_TAG: $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA

build:
  stage: build
  script:
    - docker build -t $IMAGE_TAG .
    - docker push $IMAGE_TAG
  only:
    - main

test:
  stage: test
  script:
    - docker run $IMAGE_TAG pytest

deploy:
  stage: deploy
  script:
    - ssh deploy@server "docker pull $IMAGE_TAG && docker-compose up -d"
  only:
    - main
  when: manual   # запуск вручную
```

## Концепции

```
Пайплайн:   commit → build → test → staging → prod
Артефакты:  файлы, которые передаются между jobs
Кэш:        node_modules, .pip и т.д. — ускоряет сборку
Секреты:    API ключи, пароли — никогда не в коде!
Окружения:  dev / staging / prod — разные конфиги
```

---
*Последнее обновление: —*
