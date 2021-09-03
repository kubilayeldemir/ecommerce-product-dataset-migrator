FROM python:slim-buster
WORKDIR /code
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY input/ input/
COPY main.py .
ENTRYPOINT [ "python", "./main.py" ]