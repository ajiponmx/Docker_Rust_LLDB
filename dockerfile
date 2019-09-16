FROM rust:1.37.0

RUN echo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \
    && echo "deb http://apt.llvm.org/buster/ llvm-toolchain-buster main" >> /etc/apt/sources.list \
    && echo "deb-src http://apt.llvm.org/buster/ llvm-toolchain-buster main"  >> /etc/apt/sources.list \
    && echo "# 8" >> /etc/apt/sources.list \
    && echo "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-8 main" >> /etc/apt/sources.list \ 
    && echo "deb-src http://apt.llvm.org/buster/ llvm-toolchain-buster-8 main" >> /etc/apt/sources.list \
    && echo "# 9" >> /etc/apt/sources.list \
    && echo "deb http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main" >> /etc/apt/sources.list \ 
    && echo "deb-src http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main" >> /etc/apt/sources.list \
    && echo "deb http://deb.debian.org/debian/ testing main" >> /etc/apt/sources.list \
    && cat /etc/apt/sources.list \
    && wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add - \
    && apt update \
    && apt install -y libpython2.7 libxml2 \
    && apt install -y clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev \
    libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev \
    libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python-clang


ENV DISPLAY=host.docker.internal:0.0