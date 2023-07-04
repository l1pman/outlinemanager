FROM python:3.10.9

WORKDIR /usr/src/app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./req.txt .
RUN pip install -r req.txt

COPY ./entrypoint.sh .
RUN ["chmod", "+x", "./entrypoint.sh"]

COPY . .

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]