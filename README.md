<include a CircleCI status badge, here>


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




Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
