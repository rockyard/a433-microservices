# Base Image 
FROM node:14

# working directory didalam container
WORKDIR /src

# menyalin source directory ke workdir
COPY package*.json ./

# install depedencies
RUN npm install

# unduh script dari repository
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# akses script ekseskusi 
RUN chmod +x ./wait-for-it.sh

# menyalin file index ke direktori
COPY index.js ./

# mengatur variable port
ENV PORT=3000

# Ekspos port
EXPOSE $PORT

# Perintah yang digunakan untuk mejalankan aplikasi setelah rabbitmq dimulai
CMD ["sh", "-c", "./wait-for-it.sh rabbitmq:5672 --timeout=30 -- node index.js"]