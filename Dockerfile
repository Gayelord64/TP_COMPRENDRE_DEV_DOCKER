# Etape 1: Utilisez l'image officielle de Node.js version 20 comme base.
FROM node:20

# Etape 2: Définissez le répertoire de travail dans le conteneur.
WORKDIR /usr/src/app

# Etape 3: Copiez les fichiers package.json et package-lock.json dans le répertoire de travail.
COPY package*.json ./

# Etape 4: Installez les dépendances du projet.
# Notez que si ces fichiers ne changent pas, Docker utilisera le cache pour cette couche.
RUN npm install

# Etape 5: Copiez le reste des fichiers de votre projet dans le répertoire de travail.
COPY . .

# Etape 6: Exposez le port que votre application utilisera.
EXPOSE 1337

# Etape 7: Définissez la variable d'environnement PORT à 1337.
ENV PORT=1337

# Etape 8: Lancez votre application Node.js avec la commande 'node'.
CMD [ "node", "index.js" ]
