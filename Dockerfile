# Section 1- Base Image

FROM python:3.9-slim

# Section 2- Python Interpreter Flags

ENV PYTHONUNBUFFERED 1

ENV PYTHONDONTWRITEBYTECODE 1

# Section 3- Compiler and OS libraries

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential libpq-dev \
    && rm -rf /var/lib/apt/lists/*
# Section 4- Project libraries and User Creation

COPY requirements/ /demo/requirements

RUN pip install -r demo/requirements.txt

WORKDIR /demo

EXPOSE 8000

CMD python manage.py collectstatic --no-input && python manage.py runserver 0.0.0.0:8000



