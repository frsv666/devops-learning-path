#!/bin/bash
set -euo pipefail

# ======= Настройки =======
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
USER_THRESHOLD=3
LOG_FILE="/home/sysadmin/healthcheck.log"

# ======= Цвета для вывода =======
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ======= Функции =======
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

ok()   { echo -e "${GREEN}[OK]${NC}    $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC}  $1"; log "WARN: $1"; }
fail() { echo -e "${RED}[FAIL]${NC}  $1"; log "FAIL: $1"; }

# ======= Проверки =======
check_cpu() {
    local cpu_used
    cpu_used=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)

    if (( $(echo "$cpu_used > $CPU_THRESHOLD" | bc -l) )); then
        fail "CPU usage: ${cpu_used}% (threshold: ${CPU_THRESHOLD}%)"
    else
        ok "CPU usage: ${cpu_used}%"
    fi
}


check_memory() {
    local mem_total mem_used percent
    mem_total=$(free | awk '/Mem:/ {print $2}')
    mem_used=$(free  | awk '/Mem:/ {print $3}')
    percent=$(echo "scale=0; $mem_used * 100 / $mem_total" | bc)

    if (( percent > MEMORY_THRESHOLD )); then
        fail "Memory usage: ${percent}% (threshold: ${MEMORY_THRESHOLD}%)"
    else
        ok "Memory usage: ${percent}%"
    fi
}

check_disk() {
    local disk_used
    disk_used=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    if (( disk_used > DISK_THRESHOLD )); then
        fail "Disk usage: ${disk_used}% (threshold: ${DISK_THRESHOLD}%)"
    else
        ok "Disk usage: ${disk_used}%"
    fi
}

check_service() {
    local service=$1
    if systemctl is-active --quiet "$service"; then
        ok "Service $service is running"
    else
        fail "Service $service is DOWN!"
    fi
}

check_users() {
    local count
    count=$(who | wc -l)

    if (( count > USER_THRESHOLD )); then
        fail "Users: ${count} (threshold: ${USER_THRESHOLD})"
    else
        ok "Users: ${count}"
    fi
}

# ======= Запуск =======
echo "================================"
echo " Health Check — $(date '+%Y-%m-%d %H:%M:%S')"
echo "================================"

check_cpu
check_memory
check_disk
check_service nginx
check_service ssh
check_users
echo "================================"
