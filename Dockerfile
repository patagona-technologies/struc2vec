# Base image
FROM gcr.io/cp-0308b/struc2vecbase:latest

# Set work directory
WORKDIR /usr/src/app

# Copy project
COPY graph /usr/src/app/graph
COPY src /usr/src/app/src

RUN mkdir emb
RUN mkdir pickles

RUN pip install futures==3.3.0
RUN pip install fastdtw==0.3.4

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "src/main.py"]
