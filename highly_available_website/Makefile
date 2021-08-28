REGION="us-west-2"
PROFILE="udacity_cloud_devops"

network:
	aws cloudformation create-stack \
	--stack-name haWebsite-network \
	--template-body file://network.yml  \
	--parameters file://network.json  \
	--region=$(REGION) \
	--profile=$(PROFILE)

server:
	aws cloudformation create-stack \
	--stack-name haWebsite-servers \
	--template-body file://servers.yml  \
	--parameters file://servers.json  \
	--region=$(REGION) \
	--capabilities CAPABILITY_IAM \
	--profile=$(PROFILE)

down:
	aws cloudformation delete-stack \
	--stack-name haWebsite-servers \
	--profile=$(PROFILE)

submission:
	zip joseph_corrado_submission.zip ./*