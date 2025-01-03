# Build Stage
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Production Stage
FROM nginx:1.21.6-alpine

# Copiar el archivo de configuración de Nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos construidos de Angular al directorio de Nginx
COPY --from=build /app/dist/agro-inversiones/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
