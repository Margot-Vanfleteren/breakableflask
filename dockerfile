FROM python:3.12-slim-bookworm

# Mise à jour sécurité
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Installer dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code
COPY . .

# Utilisateur non-root
RUN useradd -m appuser
USER appuser

EXPOSE 4000

CMD ["python", "main.py"]
