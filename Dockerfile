# base image Node.js versi 14 
FROM node:14

#Working directory di dalam container
WORKDIR /app

#Perintah menyalin souece code directory local ke
#container working directory /app
COPY . .

#Menentukan agar aplikasi berjalan dalam production mode 
#dan menggunakan container bernama item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

#install dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# port yang digunakan oleh aplikasi
EXPOSE 8080

# perintah menjalankan server saat container diluncurkan
CMD [ "npm", "start" ]