# API-Server 
==================================================

## Run
---

### Build the Docker image:


```bash
docker build -t api-server:latest .
```

### Run the unit tests:

```bash
docker build --target tst -t api-server:latest .
```
### Deploy 

```bash
helm install api-server -n api-server ./helm
helm test api-server -n api-server
```