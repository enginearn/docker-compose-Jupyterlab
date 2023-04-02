FROM python:slim-bullseye
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Tokyo
USER root
WORKDIR /code

COPY requirements.txt requirements.txt
RUN apt update && apt upgrade -y && \
    apt install nodejs npm -y && \
    pip install -U -r requirements.txt
