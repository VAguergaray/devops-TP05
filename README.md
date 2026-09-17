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

Ejecutar en bash:

```bash
docker run -d -p 8080:5000 valennzarat/devops-portfolio:latest
