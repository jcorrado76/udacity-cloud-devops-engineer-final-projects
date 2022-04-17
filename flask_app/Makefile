
##### ACTIVATE VIRTUAL ENV
setup:
	python -m venv .devops && /bin/sh source .devops/bin/activate

#### Create EKS Cluster
k8s:
	aws cloudformation create-stack \
		--stack-name kubernetes-cluster \
		--template-body file://cloudformation_scripts/kubernetes_cluster.yml \
		--parameters file://cloudformation_scripts/kubernetes_cluster.json \
		--capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
		--region=us-west-2


##### PIP INSTALL DEPENDENCIES
install:
	pip install --no-cache-dir pipenv==2022.4.8 && pipenv install

##### DOWNLOAD HADOLINT
install_hadolint:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && \
	chmod +x /bin/hadolint


##### LINTING
PYLINT_FLAGS=--disable=R,C,W1203,W1309
APP_FILES=app.py
lint:
	python -m pylint $(PYLINT_FLAGS) $(APP_FILES)

lint_dockerfile:
	hadolint Dockerfile

##### BUILD DOCKER IMAGE
DOCKER_IMAGE=udacity-cloud-devops-capstone
docker_image:
	docker build -t jcorrado76/$(DOCKER_IMAGE):latest .

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

CLUSTER_NAME=Udacity-Cloud-Devops-Capstone-EKS-CLUSTER
cluster:
	./generic_create_stack_script_iam_capabilities.sh $(CLUSTER_NAME) cloudformation_scripts/kubernetes_cluster.yml cloudformation_scripts/kubernetes_cluster.json

cluster_deploy:
	kubectl run flask-dash\
		--image jcorrado76/$(DOCKER_IMAGE):latest\
		--port=80\
		--labels app=flask-dash && \
	kubectl port-forward flask-dash 8050:80

cluster_config:
	aws eks update-kubeconfig --name $(CLUSTER_NAME)

cluster_test:
	kubectl get svc