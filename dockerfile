FROM rust:1.37.0

RUN apt update && apt install -y lsb-release software-properties-common \
    && wget https://apt.llvm.org/llvm.sh \
    && chmod +x llvm.sh \
    && ./llvm.sh 8 \
    && apt update \
    && apt install -y libpython2.7 libxml2


ENV DISPLAY=host.docker.internal:0.0