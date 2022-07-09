FROM alpine
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
EXPOSE 3000
