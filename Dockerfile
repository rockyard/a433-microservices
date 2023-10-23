# Base Image 
FROM node:14

# working directory didalam container
WORKDIR /app

# menyalin source directory ke workdir
COPY package*.json ./

# pengaturan konfigurasi SSL
RUN npm config set strict-ssl false

# install depedencies
RUN npm ci 

# menyalin berkas ke working directory
COPY ./*.js ./

# port yang digunakan
EXPOSE 3000

# menjalankan node saat container berjalan
CMD [ "node","index.js" ]


