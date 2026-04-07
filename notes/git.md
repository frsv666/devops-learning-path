# 🌿 Git

## Базовые команды

```bash
git init                        # инициализировать репо
git clone https://github.com/user/repo.git  # клонировать
git status                      # состояние рабочей директории
git log --oneline               # история коммитов кратко
```

## Коммиты

```bash
git add .                       # добавить все изменения
git add file.txt                # добавить конкретный файл
git commit -m "feat: add login" # закоммитить с сообщением
git commit --amend              # исправить последний коммит
```

## Ветки

```bash
git branch                      # список веток
git branch feature/login        # создать ветку
git checkout feature/login      # переключиться
git checkout -b feature/login   # создать и переключиться
git merge feature/login         # слить ветку в текущую
git branch -d feature/login     # удалить ветку
```

## Удалённый репозиторий

```bash
git remote -v                   # список remote
git push origin main            # запушить в main
git push -u origin feature/x    # запушить новую ветку
git pull origin main            # получить изменения
git fetch                       # получить без merge
```

## Откат изменений

```bash
git checkout -- file.txt        # отменить изменения в файле
git reset HEAD file.txt         # убрать из staged
git reset --soft HEAD~1         # отменить последний коммит (изменения остаются)
git reset --hard HEAD~1         # отменить последний коммит (изменения удалятся!)
git revert abc1234              # создать коммит-откат
```

## Stash

```bash
git stash                       # спрятать изменения
git stash pop                   # достать последние
git stash list                  # список stash
```

## Rebase

```bash
git rebase main                 # перебазировать на main
git rebase -i HEAD~3            # интерактивный rebase 3 коммитов
```

## Полезные алиасы (добавь в ~/.gitconfig)

```ini
[alias]
  st = status
  co = checkout
  br = branch
  lg = log --oneline --graph --all
```

## Соглашение об именах коммитов (Conventional Commits)

```
feat: новая функциональность
fix: исправление бага
docs: изменения документации
chore: рутинные задачи, обновление зависимостей
refactor: рефакторинг без изменения поведения
ci: изменения CI/CD конфигурации
```

---
*Последнее обновление: —*
