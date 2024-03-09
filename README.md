# TechChallenge-Grupo13-K8sTerraform
Este repositório é dedicado à infra Kubernetes com Terraform, com a finalidade de incorporar aprimoramentos baseados nas melhores práticas de CI/CD para a API.

Construímos toda infraestrutura serverless com Fargate, ECS e ECR:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/4c6e390d-86ee-41e5-9963-88de03449c3d)

O container criado pela Task aponta para a imagem no ECR:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/bebf65c6-ce22-49d4-b671-57f02cf70a0d)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/9ee3d86b-e527-44b5-b52f-27172a3f6a8f)


Criamos um Load Balancer para receber as requisições e as direciona ao container no ECS:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/53b776ec-fc35-452c-acdd-2338891fe525)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/e7c1859f-4d5a-4931-91b5-087ebf23284d)





