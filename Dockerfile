# Base image
FROM python:3.7.11

# Set work directory
WORKDIR /usr/src/app

# Copy project
COPY graph /usr/src/app/graph
COPY src /usr/src/app/src
COPY requirements.txt /usr/src/app/
COPY setup.py /usr/src/app/

RUN mkdir emb
RUN mkdir pickles

RUN pip install -e .

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "src/main.py"]
