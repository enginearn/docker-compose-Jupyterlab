``` Dockerfile
FROM python:latest

ENV TZ=Asia/Tokyo
USER root
WORKDIR /root/work

COPY requirements.txt requirements.txt
RUN apt update && apt upgrade -y && \
    apt install -y git neovim nodejs npm && \
    python -m pip install --no-cache-dir --upgrade pip setuptools && \
    python -m pip install --no-cache-dir --upgrade jupyterlab && \
    pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["jupyter lab"]
CMD ["jupyter lab", "--ip=0.0.0.0 --allow-root", "--no-browser", "-b", "localhost"]
```

``` PowerShell
> docker run -it --rm -p 8888:8888 --name base-jupyterlab enginearn/base-jupyter bash
```

``` bash
root@0bb3291dc2eb:/work# jupyter lab --allow-root --ip=0.0.0.0 --port=8888 --no-browser --NotebookApp.token=''
```
