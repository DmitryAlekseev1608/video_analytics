.PHONY: all
all:  start_minikube setup_docker_env enable_ingress apply_images apply_django-ingress apply_flower-worker-ingress

start_minikube:
	minikube start --docker-env="DOCKER_OPTS=--device=/dev/video0:/dev/video0"
	echo "start_minikube" > start_minikube

setup_docker_env:
	eval $(minikube docker-env) && docker build -t checkpoint6/django:latest videoanalytics
	echo "setup_docker_env" > setup_docker_env

enable_ingress:
	minikube addons enable ingress
	echo "enable_ingress" > enable_ingress

apply_images:
	kubectl apply -f k8s/
	echo "apply_postgres" > apply_images

apply_django-ingress:
	@status=1; \
	while [ $$status -ne 0 ]; do \
		kubectl apply -f k8s/django-ingress.yaml ; \	
		status=$$?; \
	done
	echo "apply_django-ingress" > apply_django-ingress

apply_flower-worker-ingress:
	@status=1; \
	while [ $$status -ne 0 ]; do \
		kubectl apply -f k8s/flower-worker-ingress.yaml ; \		
		status=$$?; \
	done
	rm -f start_minikube setup_docker_env enable_ingress apply_images apply_django-ingress