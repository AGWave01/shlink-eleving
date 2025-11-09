## Installation path

### Prerequisites
- NGINX Ingress Controller

## Installation

- create ns shlink - "kubectl create namespace shlink"
- create auth secret for web - "kubectl create secret generic shlink-web-auth --from-literal=auth="admin:password1234" -n shlink"
- create db password secret - "kubectl create secret generic shlink-stack-postgresql --from-literal=password="password1234" --from-literal=postgres-password="password1234" -n shlink"
- install chart - "helm upgrade --install shlink-stack . -n shlink -f values.yaml"

### Upgrade plan to v4.6

To make an upgrade, should be updated the image tag in values.yaml file from 4.4.0 to 4.6.0 for both backend and web, then should be run the "helm upgrade --install" command. After the upgrade completes, should be verified that all pods are running and using version 4.6.0

## Database password rotation options

### First option
First automatic option, a CronJob runs on a defined schedule, for example every month to generate a new random password, update it in postgres refresh the k8s secret and restart the shlink pods so they pick up the new credentials.

### Second option

Second option is manual rotation. Should be generated a new random password, so then, connect to the database pod and use the ALTER USER command to update the password for the Shlink user. After that should be updated the k8s Secret that stores the database credentials with the new password, and finally restart the deployment using a rollout restart command.
