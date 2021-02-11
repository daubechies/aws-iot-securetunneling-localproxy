echo "Setting up environment"

# Variables
echo 'export AWS_ROLE_ROLE="ops/admin"' >>$BASH_ENV

case "$CIRCLE_BRANCH" in
master)
  echo 'export ENVIRONMENT="production"' >>$BASH_ENV
  echo 'export AWS_EKS_CLUSTER_NAME=production-eks-jane-be' >>$BASH_ENV
  echo 'export AWS_ROLE_ACCOUNT="011658041522"' >>$BASH_ENV
  echo 'export AWS_ECR_ACCOUNT_URL=011658041522.dkr.ecr.eu-west-1.amazonaws.com' >>$BASH_ENV
  ;;
develop)
  echo 'export ENVIRONMENT="dev"' >>$BASH_ENV
  echo 'export AWS_EKS_CLUSTER_NAME=staging-eks-jane-be' >>$BASH_ENV
  echo 'export AWS_ROLE_ACCOUNT="290644463750"' >>$BASH_ENV
  echo 'export AWS_ECR_ACCOUNT_URL=290644463750.dkr.ecr.eu-west-1.amazonaws.com' >>$BASH_ENV
  ;;
staging)
  echo 'export ENVIRONMENT="staging"' >>$BASH_ENV
  echo 'export AWS_EKS_CLUSTER_NAME=staging-eks-jane-be' >>$BASH_ENV
  echo 'export AWS_ROLE_ACCOUNT="290644463750"' >>$BASH_ENV
  echo 'export AWS_ECR_ACCOUNT_URL=290644463750.dkr.ecr.eu-west-1.amazonaws.com' >>$BASH_ENV
  ;;
*)
  # For builds / testing / ...  
  echo "not a branch that needs deploying"
  echo 'export ENVIRONMENT="dev"' >>$BASH_ENV
  echo 'export AWS_EKS_CLUSTER_NAME=staging-eks-jane-be' >>$BASH_ENV
  echo 'export AWS_ROLE_ACCOUNT="290644463750"' >>$BASH_ENV
  echo 'export AWS_ECR_ACCOUNT_URL=290644463750.dkr.ecr.eu-west-1.amazonaws.com' >>$BASH_ENV
  ;;
esac