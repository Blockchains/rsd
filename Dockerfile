FROM node

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    git \
    make

# Install Go 1.12.
RUN curl https://dl.google.com/go/go1.12.linux-amd64.tar.gz | tar -C /usr/local -xz
ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /reserve-dollar
COPY package.json package-lock.json go.mod go.sum ./
RUN npm install
RUN go mod download

ENTRYPOINT ["bash"]
