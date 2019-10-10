# rails-ecs-boilerplate

## Setup

### Setup ECR

validation
```bash
aws cloudformation validate-template \
  --template-body file://infra/ecr.yaml
```

create-stack
```bash
aws cloudformation create-stack \
  --stack-name messaging-arch-ecr-1 \
  --template-body file://infra/ecr.yaml
```

### Register image on ECR

```bash
$ AWS_ACCOUNT=xxxxxxx
$ $(aws ecr get-login --no-include-email)
$ make build AWS_ACCOUNT=$AWS_ACCOUNT
$ make push AWS_ACCOUNT=$AWS_ACCOUNT
```

### Setup KMS

validation
```bash
aws cloudformation validate-template \
  --template-body file://infra/kms.yaml
```

create-stack
```bash
aws cloudformation create-stack \
  --stack-name messaging-arch-kms-1 \
  --template-body file://infra/kms.yaml
```

### Setup ECS

validation
```bash
aws cloudformation validate-template \
  --template-body file://infra/ecs.yaml
```

create-stack
```bash
KMSKeyArn=xxxxxx
OrderSecretKeyBaseSecretArn=xxxxxx
OrderDatabaseUrlSecretArn=xxxxxx
InvoiceSecretKeyBaseSecretArn=xxxxxx
InvoiceDatabaseUrlSecretArn=xxxxxx
DeliverySecretKeyBaseSecretArn=xxxxxx
DeliveryDatabaseUrlSecretArn=xxxxxx
GitHubToken=xxxx

aws cloudformation create-stack \
  --stack-name messaging-arch-ecs-1 \
  --template-body file://infra/ecs.yaml \
  --capabilities CAPABILITY_IAM \
  --parameters \
    ParameterKey=KMSKeyArn,ParameterValue=$KMSKeyArn \
    ParameterKey=OrderSecretKeyBaseSecretArn,ParameterValue=$OrderSecretKeyBaseSecretArn \
    ParameterKey=OrderDatabaseUrlSecretArn,ParameterValue=$OrderDatabaseUrlSecretArn \
    ParameterKey=InvoiceSecretKeyBaseSecretArn,ParameterValue=$InvoiceSecretKeyBaseSecretArn \
    ParameterKey=InvoiceDatabaseUrlSecretArn,ParameterValue=$InvoiceDatabaseUrlSecretArn \
    ParameterKey=DeliverySecretKeyBaseSecretArn,ParameterValue=$DeliverySecretKeyBaseSecretArn \
    ParameterKey=DeliveryDatabaseUrlSecretArn,ParameterValue=$DeliveryDatabaseUrlSecretArn \
    ParameterKey=GitHubToken,ParameterValue=$GitHubToken
```

### Register Secrets on SecretsManager
- SECRET_KEY_BASE
- DATABASE_URL

## Concerns

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
