FROM tensorflow/tensorflow:1.13.1-py3-jupyter
RUN apt-get update && apt-get install -y git-core tmux wget vim python-pil python-lxml python-tk unzip curl

# clone all models from tensorflow
RUN git clone https://github.com/tensorflow/models.git /notebooks/object/models
WORKDIR "/notebooks/object"

# install protoc v3.0.0 & compile *.proto
COPY install.sh install.sh
RUN bash install.sh

# install python packages
COPY requirements.txt requirements.txt
RUN pip install -r ./requirements.txt

# set python path
ENV PYTHONPATH="$PYTHONPATH:/notebooks/object/models/research:/notebooks/object/models/research/slim"

