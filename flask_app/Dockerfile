FROM python:3.7.3-stretch

WORKDIR /app

COPY requirements.txt Makefile /app/

RUN make install

COPY app.py /app/

EXPOSE 8050

CMD ["python", "app.py"]