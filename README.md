## Get started
------

### Build the image

```bash
cd to tmodel
docker build -t tmodle -f dockerfile .
```

> You might stuck with "Cloning into '/notebooks/object/models'..." in red. Just wait 10 minutes and press Ctrl + c in Windows / cmd + c in Mac to stop. Applied the command one more time.

### Start container

```bash
docker run -it -p 8888:8888 -p 6006:6006 --name tmodel tmodle bash
```

### Validate setups inside docker

```bash
echo $PYTHONPATH
cd models/research/
python object_detection/builders/model_builder_test.py
cd ../..
```

##### The result should be as follows:
> :/notebooks/object/models/research:/notebooks/object/models/research/slim

> .......( some information ) .......

> Ran 16 tests in 0.062s
> 
> OK (skipped=1)

### Start jupyter notebook inside docker

```bash
jupyter notebook --allow-root --ip=0.0.0.0 --port=8888

# go to http://127.0.0.1:8888 or copy the url start with http:// in the result
# The token is in url
```

### Open a new terminal to attach to container

```bash
docker exec -it tmodel /bin/bash
```

### if your machine restart, you can start container

```bash
docker ps -a
docker start -i tmodel
```

### You can use tmux to split the screen

```bash
tmux

# Ctrl + b, %
# Ctrl + b, -> or <-
```

### Start tensorboard

```bash
tensorboard --logdir='data'
```

## Try object detection
------

### Run in jupyter notebook

> Go to e.g. http://127.0.0.1:8888/?token=de478f72cc4f5807af85eb583abb207f0ba4eae1e1b65c89
> Click models/research/object_detection
> Click object_detection_tutorial.ipynb
> Run each block

### Show results

In the last block, you have to put

```PYTHON
%pylab inline # Add this line at the begin
for image_path in TEST_IMAGE_PATHS:
  # ....
  plt.imshow(image_np)
  plt.show() # Add this line at the end
```

> After a few moments, it should show you two images with box highlighted.

### Notes for you

```bash
# compile proto files which is already taking care of in install.sh
# protoc use version 3.0
cd models/research/
./bin/protoc --version
./bin/protoc object_detection/protos/*.proto --python_out=.

# check python path
echo $PYTHONPATH
```
