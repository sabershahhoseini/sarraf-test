FROM alpine
RUN apk add --no-cache python3 g++ make
WORKDIR /app
COPY . .
EXPOSE 3000
