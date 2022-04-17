FROM python:3.10-slim

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

WORKDIR /app

COPY Pipfile Pipfile.lock Makefile /app/

RUN pip install --no-cache-dir pipenv==2022.4.8 && pipenv install

COPY app.py /app/

EXPOSE 8050

CMD ["pipenv", "run", "python", "app.py"]