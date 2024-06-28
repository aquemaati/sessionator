# Utiliser une image de base Ubuntu compatible ARM
FROM ubuntu:22.04

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    xz-utils \
    curl \
    build-essential

# Installer Go 1.22.4 pour ARM64
RUN curl -OL https://golang.org/dl/go1.22.4.linux-arm64.tar.gz && \
    tar -C /usr/local -xzf go1.22.4.linux-arm64.tar.gz && \
    rm go1.22.4.linux-arm64.tar.gz

# Configurer les variables d'environnement pour Go
ENV PATH="/usr/local/go/bin:${PATH}"

# Définir le répertoire de travail
WORKDIR /workspace

# Copier les fichiers de votre projet dans le conteneur
COPY . .

# Exposer le port (si nécessaire)
EXPOSE 8080

# Commande par défaut (si nécessaire)
CMD ["bash"]
