FROM python:3.10-buster as tst

WORKDIR /code
COPY . /code/

RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/code
RUN py.test tests/tests.py --cov=webapp


FROM python:3.10-buster

ENV PYTHONUNBUFFERED=1
ENV HOST=0.0.0.0
ENV PORT=8000
ENV PYTHONPATH=/code


WORKDIR /code
COPY . /code/

RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt


CMD uvicorn application:app --host ${HOST} --port ${PORT}
