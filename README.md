# TP05 — Docker: primera app en contenedor

## Qué contiene

API Python con framework Flask corriendo en Docker, con buenas prácticas de producción.

## Endpoints

| Ruta | Descripción |
|---|---|
| `GET /` | Status de la app |
| `GET /health` | Uptime, hostname, entorno |
| `GET /info` | Versión y metadata |

## Correr localmente

Ejecutar en bash
docker run -d -p 8080:5000 TU_USUARIO/devops-portfolio:latest
curl http://localhost:8080/health
Buenas prácticas aplicadas
•	python:3.12-slim en lugar de python:3.12 (imagen 6x más liviana)
•	COPY requirements.txt antes del código (caché de capas)
•	--no-cache-dir en pip (imagen más liviana)
•	Usuario no-root (appuser) por seguridad
•	gunicorn en lugar de flask run (servidor de producción)
•	Variables de entorno para configuración dinámica
Imagen en Docker Hub
docker pull TU_USUARIO/devops-portfolio:latest 
