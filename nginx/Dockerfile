# Utilisez une image de base officielle d'nginx
FROM nginx:alpine

RUN apk update && apk add nano

# Copiez les fichiers de configuration ou de contenu supplémentaires si nécessaire
# COPY default.conf /etc/nginx/conf.d/default.conf
# COPY ../php/src/index.php /usr/share/nginx/app/public/php


# Exposez le port 80 pour que nginx puisse être accessible depuis l'extérieur
EXPOSE 80

# Commande pour démarrer nginx 
CMD ["nginx", "-g", "daemon off;"]
