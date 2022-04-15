<<<<<<< HEAD
# Udacity Cloud DevOps Engineer
***
## [Cloud DevOps Engineer Nanodegree Program](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991)
***
This repository is going to house all of the final projects for the courses in my Udacity Cloud DevOps Engineer Nanodegree program.

Operationalize infrastructure at scale and deliver applications and services at high velocity.
Learn to design and deploy infrastructure as code, build and monitor CI/CD pipelines for different deployment strategies, and deploy
scalable microservices using Kubernetes.

Projects:
* [Deploy static website on AWS](https://github.com/jcorrado76/udacity-cloud-devops-engineer-final-projects/tree/dev/static_website)
* [Deploy a High-Availability (HA) website app on AWS using CloudFormation](https://github.com/jcorrado76/udacity-cloud-devops-engineer-final-projects/blob/dev/highly_available_website/README.md)
* [Give your Application Auto-Deploy Superpowers](https://github.com/jcorrado76/udacity-cloud-devops-engineer-final-projects/blob/dev/application_auto_deploy_superpowers/README.md)
* [Operationalize a Machine Learning Microserivce API](https://github.com/jcorrado76/udacity-cloud-devops-engineer-final-projects/blob/dev/ml_microservices/README.md)
* Capstone Project:

Certificate:
* 
=======
## Cloud DevOps Capstone Project
In this project, we'll develop a web application that will be deployed onto a kubernetes cluster of our choosing, and integrated with a CI/CD server.
Finally, we'll make use of docker format containers by uploading our images to DockerHub.

The web app for this project so far is just a simple toy dash plotly dashboard. 
## The Repository
The GitHub repository for this codebase can be found [here](https://github.com/jcorrado76/udacity-cloud-devops-capstone)

<<<<<<< HEAD
>>>>>>> 38c5233 (Initial commit)
=======
# Creating the EKS Cluster
1. Go into EKS, and create a cluster
2. Create an IAM role for EKS (the EKS - Cluster use case) with the following policies:
    * AmazonEKSClusterPolicy
3. Attach the role created to the cluster
4. Now we need to create networking:
    * Go to CloudFormation
    * Create Stack
    * Template is ready
    * Amazon S3 URL
    * Go to [this link](https://docs.aws.amazon.com/eks/latest/userguide/creating-a-vpc.html#create-vpc) and grab the URL for Public and private subnets
    * Paste that URL into the CloudFormation template, and hit next
    * Give the stack a name and create it
5. Now select the VPC that was created, and use it for the cluster. Check that the subnets that were created are also being used.
6. For Cluster endpoint access, choose Public and Private so that the cluster will be accessible from outside the VPC, while worker node traffic to the endpoint will stay within the VPC.
7. Now we need to configure your ~/.kube/config file to point to the new EKS cluster:
    1. Create a copy of your previous ~/.kube/config file (~/.kube/config.old)
    2. Wait until your EKS cluster is created
    3. Then run `aws eks --region <region-name> update-kubeconfig --name <cluster-name>` (remember to check the region your cluster is in!!)
8. Now we need to add a node group (our worker nodes):
    1. Create the IAM role for the EC2 use case with the appropriate policies:
        * AmazonEKSWorkerNodePolicy
        * AmazonEKS_CNI_Policy
        * AmazonEC2ContainerRegistryReadOnly
    2. Create a node group with a name and the role we just created:
        * Amazon Linux 2
        * t3.small (use small here, not micro - scheduling can fail if your instance can't handle the load)
        * Leave the auto-scaling to its default (desired 2, min 2, max 2)
        * Then go to networking, and make sure the subnets match the ones in your VPC
        * Then create the node group
        * Wait until your node group becomes Active
9. Now apply your kubectl yaml files:
Check the current context in use with:
```bash
kubectl config current-context
```
Read more about context configurations [at this link](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-context-and-configuration)

```bash
kubectl apply -f=<kubectl-yaml-file>
```
10. Check that it worked with:
```bash
kubectl get deployments
kubectl get pods
kubectl get services
```
When you run that last one, now our external-IP should be the URL we go to to access the dashboard.

Then, you should be able to navigate to that URL and see your dashboard!
# Debugging
Read [this article](https://komodor.com/learn/how-to-fix-errimagepull-and-imagepullbackoff/) for useful tips on how to debug when
you have an error pulling an image.

They describe how to check which particular error was raised when pulling the image as well. 
>>>>>>> f6fcdfd (Added a docker check step to CI/CD. Also updated README to contain steps for how to create EKS cluster)
