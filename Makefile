
##### ACTIVATE VIRTUAL ENV
setup:
	python -m venv .devops && /bin/bash source .devops/bin/activate

#### Create EKS Cluster
k8s:
	aws cloudformation create-stack \
		--stack-name kubernetes-cluster \
		--template-body file://cloudformation_scripts/kubernetes_cluster.yml \
		--parameters file://cloudformation_scripts/kubernetes_cluster.json \
		--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
		--region=us-west-2


##### PIP INSTALL DEPENDENCIES
PIP_INSTALL_FLAGS=--no-cache-dir -r
install:
	pip install --upgrade pip && pip install $(PIP_INSTALL_FLAGS) requirements.txt

##### DOWNLOAD HADOLINT
install_hadolint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && \
	chmod +x /bin/hadolint


##### LINTING
PYLINT_FLAGS=--disable=R,C,W1203,W1309
APP_FILES=app.py
lint:
	hadolint Dockerfile && pylint $(PYLINT_FLAGS) $(APP_FILES)

##### BUILD DOCKER IMAGE
DOCKER_IMAGE=udacity-cloud-devops-webapp
docker_image:
	docker build -t $(DOCKER_IMAGE):latest .

push_image:
	docker push jcorrado76/$(DOCKER_IMAGE):latest


##### RUN DOCKER IMAGE
DOCKER_CONTAINER_NAME=udacity-devops-capstone-webapp
DOCKER_PORT=8050
webapp:
	docker run --name  $(DOCKER_CONTAINER_NAME) --detach -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_IMAGE)
stop_webapp:
	docker stop $(DOCKER_CONTAINER_NAME)
rm_container:
	docker rm $(DOCKER_CONTAINER_NAME)