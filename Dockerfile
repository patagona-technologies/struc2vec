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

# Copy over the GCP login file
COPY cp-0308b-28dc9b0b1cdb.json /usr/src/app/

ENV MLFLOW_TRACKING_URI=https://mlflow-up3b2lt5ha-uw.a.run.app
ENV MLFLOW_TRACKING_USERNAME=patagona
ENV MLFLOW_TRACKING_PASSWORD=cp0308b-password-93784
ENV GOOGLE_APPLICATION_CREDENTIALS=cp-0308b-28dc9b0b1cdb.json

# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python3", "src/main.py"]
