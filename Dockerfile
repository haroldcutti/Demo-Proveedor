FROM node:18 AS build
WORKDIR /app

COPY . .

RUN npm install

RUN npm run build --prod

FROM nginx:alpine

COPY --from=build /app/dist/agro-inversiones /usr/share/nginx/html

EXPOSE 80

Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]