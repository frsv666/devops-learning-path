# ☸️ Kubernetes

## kubectl основы

```bash
kubectl get pods                         # список подов
kubectl get pods -n kube-system          # в другом namespace
kubectl get all                          # все ресурсы
kubectl describe pod my-pod              # подробная информация
kubectl logs my-pod                      # логи пода
kubectl logs -f my-pod                   # следить за логами
kubectl exec -it my-pod -- bash          # войти в под
kubectl delete pod my-pod               # удалить под
```

## Манифесты

### Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
  namespace: default
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
      - name: my-app
        image: nginx:1.25
        ports:
        - containerPort: 80
        resources:
          requests:
            memory: "64Mi"
            cpu: "250m"
          limits:
            memory: "128Mi"
            cpu: "500m"
```

### Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-app-svc
spec:
  selector:
    app: my-app
  ports:
  - port: 80
    targetPort: 80
  type: ClusterIP       # ClusterIP / NodePort / LoadBalancer
```

### ConfigMap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  APP_ENV: production
  LOG_LEVEL: info
```

### Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
type: Opaque
data:
  password: cGFzc3dvcmQ=   # base64: echo -n "password" | base64
```

## Применение манифестов

```bash
kubectl apply -f deployment.yaml        # применить манифест
kubectl apply -f ./k8s/                 # применить директорию
kubectl delete -f deployment.yaml       # удалить по манифесту
kubectl diff -f deployment.yaml         # показать изменения
```

## Масштабирование

```bash
kubectl scale deployment my-app --replicas=5
kubectl rollout status deployment my-app
kubectl rollout undo deployment my-app  # откатить деплой
```

## Namespaces

```bash
kubectl get namespaces
kubectl create namespace staging
kubectl config set-context --current --namespace=staging
```

## Helm

```bash
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm search repo nginx
helm install my-release stable/nginx    # установить chart
helm list                               # список релизов
helm upgrade my-release stable/nginx    # обновить
helm uninstall my-release               # удалить
helm template ./mychart                 # рендер без установки
```

---
*Последнее обновление: —*
