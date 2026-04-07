# 📊 Мониторинг

## Prometheus

### Основные концепции

```
Метрика:    числовые данные с метками (labels)
Scrape:     Prometheus сам опрашивает цели (pull модель)
Exporter:   агент, который отдаёт метрики (node_exporter, etc.)
PromQL:     язык запросов к метрикам
Alertmanager: маршрутизация и отправка алертов
```

### Типы метрик

```
Counter:    только растёт (запросы, ошибки)
Gauge:      может расти и падать (CPU, память)
Histogram:  распределение значений (latency)
Summary:    похож на histogram, квантили на клиенте
```

### PromQL примеры

```promql
# Загрузка CPU (%)
100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Свободная память
node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100

# HTTP запросы в секунду
rate(http_requests_total[5m])

# Процент ошибок
rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m])

# 95-й перцентиль latency
histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))
```

### docker-compose для стека

```yaml
version: '3.8'
services:
  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    environment:
      - GF_SECURITY_ADMIN_PASSWORD=admin

  node-exporter:
    image: prom/node-exporter
    ports:
      - "9100:9100"
```

### prometheus.yml

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['node-exporter:9100']

  - job_name: 'my-app'
    static_configs:
      - targets: ['my-app:8080']
```

## Alerting правило

```yaml
groups:
- name: example
  rules:
  - alert: HighCPU
    expr: 100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
    for: 5m
    labels:
      severity: warning
    annotations:
      summary: "High CPU on {{ $labels.instance }}"
```

## Loki (логи)

```yaml
# promtail конфиг — агент для сбора логов
scrape_configs:
  - job_name: containers
    static_configs:
      - targets: [localhost]
        labels:
          job: containerlogs
          __path__: /var/lib/docker/containers/*/*log
```

---
*Последнее обновление: —*
