FROM python:3.9.7-bullseye

WORKDIR /src
COPY . .
ENV PYTHONPATH "${PYTHONPATH}:/src/src"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git gcc
RUN python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install

CMD ["python3.9", "src/__main__.py"]
