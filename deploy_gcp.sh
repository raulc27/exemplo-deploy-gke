#!/bin/bash

PROJECT_ID=""
PROJECT_ID_NAME=""
BILLING_ACCOUNT_NUMBER=""
GKE_NAME=""

# criar projeto GCP
gcloud projects create $PROJECT_ID --name=$PROJECT_ID_NAME

# acessar projeto
gcloud config set project $PROJECT_ID

# linkar billing account
gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT_NUMBER

# liberando serviços (container, registry e cloudbuild)
gcloud services enable containerregistry.googleapis.com
gcloud services enable container.googleapis.com
gcoud services enable cloudbuild.googleapis.com

# criando GKE (Kubernetes)
gcloud container clusters create $GKE_NAME\
--zone=europe-west1-d \
--machine-type=n1-standard-2 \
--enable-autoscaling \
--min-nodes=1 \
--max-nodes=3