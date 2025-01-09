# Etapa de construcción
FROM node:18 AS build
WORKDIR /app

# Copiar el código fuente
COPY . .

# Instalar dependencias y construir el proyecto
RUN npm install
RUN npm run build --prod

# Etapa de producción con Apache
FROM httpd:alpine

# Copiar los archivos construidos al directorio de Apache
COPY --from=build /app/dist/agro-inversiones /usr/local/apache2/htdocs/

# Exponer el puerto 80 para Apache
EXPOSE 80

# Comando para iniciar Apache
CMD ["httpd", "-D", "FOREGROUND"]
