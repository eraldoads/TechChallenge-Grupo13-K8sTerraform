# TechChallenge-Grupo13-K8sTerraform
Este repositório é dedicado à infra Kubernetes com Terraform, com a finalidade de incorporar aprimoramentos baseados nas melhores práticas de CI/CD para a API.

O deploy de todos os recursos é realizado pelo Github Actions a partir dos arquivos Terraform.

Construímos toda infraestrutura serverless com Fargate, ECS e ECR. 

Criamos um cluster no ECS, o qual contém a service e a task:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/4c6e390d-86ee-41e5-9963-88de03449c3d)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/a581a105-e863-4e7b-bee3-9be4a4f14331)

Criamos um Load Balancer para receber as requisições e as direciona para a service:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/53b776ec-fc35-452c-acdd-2338891fe525)

O container criado pela task aponta para a imagem no ECR:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/bebf65c6-ce22-49d4-b671-57f02cf70a0d)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/9ee3d86b-e527-44b5-b52f-27172a3f6a8f)

Atráves do endereço DNS do load balancer, podemos acessar o swagger da API:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/e7c1859f-4d5a-4931-91b5-087ebf23284d)





