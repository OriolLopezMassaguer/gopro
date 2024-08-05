FROM haskell:9.6.4-slim

RUN apt-get update
RUN apt-get install -y ffmpeg libpq5 libpq-dev zlib1g zlib1g-dev

WORKDIR /usr/lib/gopro
COPY stack.yaml stack.yaml
COPY package.yaml package.yaml
COPY Setup.hs setup.hs
COPY app .
COPY src .
COPY static .
COPY ui .
RUN stack install

CMD ["/root/.local/bin/gopro"]
