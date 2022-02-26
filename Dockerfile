FROM python:3.7.3-stretch

WORKDIR /app

hellohello
COPY app.py requirements.txt Makefile /app/

RUN make install

EXPOSE 8050

CMD ["python", "app.py"]