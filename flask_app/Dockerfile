FROM python:3.7.3-stretch

WORKDIR /app

COPY flask_app/requirements.txt flask_app/Makefile /app/

RUN make install

COPY flask_app/app.py /app/

EXPOSE 8050

CMD ["python", "app.py"]