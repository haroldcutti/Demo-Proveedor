FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --configuration production

FROM nginx:1.21.6-alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist/agro-inversiones/browser /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]  