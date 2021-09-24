[![CircleCI](https://circleci.com/gh/jcorrado76/operationalize_machine_learning_microservice/tree/dev.svg?style=svg)](https://circleci.com/gh/jcorrado76/operationalize_machine_learning_microservice/tree/dev)

## Introduction
In this project, we created a docker container that hosted a pre-trained model that allowed us to return house price predictions from a machine learning model. 

The files in this project are:
* .circleci/config.yml - the CircleCI CI configuration YAML file
* model_data/boston_housing_prediction.joblib - the pre-trained model
* app.py - the flask entrypoint application
* Dockerfile - the specification of how to build a docker formatted container to serve predictions
* make_prediction.sh - a shell script that feeds an example input into our pre-trained model
* Makefile - a makefile containing instructions for performing various actions such as linting our code
* requirements.txt - a file of required packages to run the model
* run_docker.sh - a shell script that builds the image, then runs a container from that image
* run_kubernetes.sh - a shell script that lists our kubernetes pods and performs port forwarding between our docker containers in the pods and the host machine
* upload_docker.sh - a shell script that uploads our docker image to our docker hub

## How to run
To run the code in this project, you:
* create a virtual environment, and activate it
* run `make install` to install the requirements from the `requirements.txt` file

Then, you can run the application in one of three ways:
1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`
