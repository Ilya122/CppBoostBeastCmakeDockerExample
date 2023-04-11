FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install g++ cmake

COPY . .

RUN mkdir build

WORKDIR /build

RUN cmake ..
RUN cmake --build . --config Release

ENV PORT=8080
EXPOSE 8080

CMD "/build/cpp_http_server" "0.0.0.0" "8080"