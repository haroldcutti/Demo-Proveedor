# Build Stage
FROM node:18 as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Production Stage
FROM nginx:1.21.6-alpine
COPY --from=build /dist/agro-inversiones /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
