# ── Etapa base: imagen oficial liviana ──────────────────
FROM python:3.12-slim

# Metadatos de la imagen
LABEL maintainer="devops"
LABEL version="1.0.0"
LABEL description="DevOps Portfolio API"

# Variables de entorno recomendadas para Python en Docker
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=5000 \
    APP_ENV=production

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar dependencias PRIMERO (aprovecha caché de capas)
# Si solo cambia el código, esta capa no se rebuilds
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código de la app
COPY app.py .

# Puerto que expone el contenedor (documentación)
EXPOSE 5000

# Usuario no-root por seguridad (buena práctica)
RUN useradd --create-home appuser
USER appuser

# Comando de arranque con gunicorn (servidor de producción)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
