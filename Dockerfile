# this docker file is supposed to be for server, since I am using same repo for client and server,
# client is hosted from gh-pages and server with huggingface,
# huggingface docker requires a docker file in root folder of repo

FROM python:3.9

WORKDIR /code

COPY ./client/requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./client .

CMD ["gunicorn", "-b" ,"0.0.0.0:7860", "mathemagics:app"]