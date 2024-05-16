# TechChallenge-Grupo13-K8sTerraform
Este repositório é dedicado à infra Kubernetes com Terraform, com a finalidade de incorporar aprimoramentos baseados nas melhores práticas de CI/CD para a API.

O deploy de todos os recursos é realizado pelo Github Actions a partir dos arquivos Terraform.

## 🖥️ Grupo 13 - Integrantes
🧑🏻‍💻 *<b>RM352133</b>*: Eduardo de Jesus Coruja </br>
🧑🏻‍💻 *<b>RM352316</b>*: Eraldo Antonio Rodrigues </br>
🧑🏻‍💻 *<b>RM352032</b>*: Luís Felipe Amengual Tatsch </br>

Construímos toda infraestrutura serverless com Fargate, ECS e ECR. 

Criamos um cluster no ECS, o qual contém as services e as tasks de cada aplicação:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/4c6e390d-86ee-41e5-9963-88de03449c3d)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/948b9470-fa00-4f28-af7a-c6182001745f)


Criamos um Load Balancer para receber as requisições e as direciona para a service:



O container criado pela task aponta para a imagem no ECR:











