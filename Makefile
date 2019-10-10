ORDER_REPOSITORY := $(AWS_ACCOUNT).dkr.ecr.ap-northeast-1.amazonaws.com/messaging-arch/order-service
INVOICE_REPOSITORY := $(AWS_ACCOUNT).dkr.ecr.ap-northeast-1.amazonaws.com/messaging-arch/invoice-service
DELIVERY_REPOSITORY := $(AWS_ACCOUNT).dkr.ecr.ap-northeast-1.amazonaws.com/messaging-arch/delivery-service

build:
	docker build -t order-service ./order-service
	docker build -t invoice-service ./invoice-service
	docker build -t delivery-service ./delivery-service

tag:
	docker tag order-service:latest $(ORDER_REPOSITORY):latest
	docker tag invoice-service:latest $(INVOICE_REPOSITORY):latest
	docker tag delivery-service:latest $(DELIVERY_REPOSITORY):latest

push: tag
	docker push $(ORDER_REPOSITORY):latest
	docker push $(INVOICE_REPOSITORY):latest
	docker push $(DELIVERY_REPOSITORY):latest
