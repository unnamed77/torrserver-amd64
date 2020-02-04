FROM ubuntu
LABEL maintainer="https://github.com/unnamed77"

# Version
ENV SERVER_VERSION="1.1.76_7"

#File name
ENV FILE_NAME="TorrServer-linux-amd64"

#  Path to File
ENV URL="https://github.com/unnamed77/torrserver-amd64/raw/master/${FILE_NAME}"

# Work directory
ENV WORK_DIR="/opt/torrserver"

# Torrserver UI port
ENV PORT="8090"

#make dir and download binaries
RUN apt-get update && apt-get install -y wget &&mkdir -p ${WORK_DIR} && cd ${WORK_DIR} && wget ${URL} && chmod +x ${FILE_NAME}
# Expose port
EXPOSE ${PORT}

# Run TorrServer
WORKDIR ${WORK_DIR}
VOLUME ${WORK_DIR}
ENTRYPOINT ./${FILE_NAME}
