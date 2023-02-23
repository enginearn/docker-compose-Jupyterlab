FROM python:3.11.2-slim-bullseye
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Tokyo
USER root
WORKDIR /root/code

COPY requirements.txt requirements.txt
RUN apt update && apt upgrade -y && \
    apt install nodejs npm -y && \
    pip install -U -r requirements.txt
