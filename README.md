Terraform cloud:

The terraform cloud offers a remote plan execution of a terraform plan and manages the lifecyle of the terraform state. This is very useful for medium to large deployments as the state can easily get lost if using terraform scripts manually from a laptop. 

The cloud allows for more than one user to manage the terraform plans and email/slack notifications can be configured for any change to the terraform plans. The free tier allows up to 5 users.

The cloud also offers paid services such as cost estimation. From what I can tell at 20 dollars per user. For more info visit terraform pricing 

One minor issue I ran into was that I have to keep updating the VCS settings on the terraform UI when I make changes to the terraform scripts in the github in the repo.  Issue went away when I configured the terraform app on github and allowed access to the example github repository. 

Below are steps to manually apply/destroy a plan using an example github repo that creates two s3 buckets and two instances. 

Create an account on terraform: terraform cloud

Click the Workspace tab on top and click + New Workspace to create a workspace using VCS flow and point to github repository.

Under Variables, configure aws credentials as Environment Variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY and make sure you mark them as sensitive. 

Under Variables, configure any other variables needed by the terraform scripts. For values that are not strings mark them as HCL. A list of email addresses should be [“xxx@gmail.com”].  See Input Variables in Terraform for more details. The plan in this example repo requires  the variable instance_type. It can be to t2.large if interested in cost estimation. 

Queue Plan Manually and Confirm to apply the terraform plan.

Under Settings, select Destruction and Deletion and click Destroy Plan. 
and make sure you Confirm 

