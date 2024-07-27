# TechChallenge-Grupo13-K8sTerraform
Este repositório é dedicado à infra Kubernetes com Terraform, com a finalidade de incorporar aprimoramentos baseados nas melhores práticas de CI/CD para a API.

O deploy de todos os recursos é realizado pelo Github Actions a partir dos arquivos Terraform.

## 🖥️ Grupo 13 - Integrantes
🧑🏻‍💻 *<b>RM352133</b>*: Eduardo de Jesus Coruja </br>
🧑🏻‍💻 *<b>RM352316</b>*: Eraldo Antonio Rodrigues </br>
🧑🏻‍💻 *<b>RM352032</b>*: Luís Felipe Amengual Tatsch </br>

Construímos toda infraestrutura serverless com Fargate, ECS e ECR. 

Criamos um cluster no ECS, o qual contém as services e as tasks de cada aplicação. 
No momento, temos três microsserviços que foram desmembrados do monolito e o monolito em si, totalizando quatro aplicações.

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/4c6e390d-86ee-41e5-9963-88de03449c3d)

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/948b9470-fa00-4f28-af7a-c6182001745f)

Para cada aplicação, criamos um load balancer para receber as requisições e as direcionar para a respectiva service:

![image](https://github.com/eraldoads/TechChallenge-Grupo13-K8sTerraform/assets/47857203/fc019b94-33bf-4682-8ce6-d3d4713b6d79)

O desenho abaixo ilustra a arquitetura utilizada, abrangendo os microsserviços e suas conexões com os bancos de dados e o broker de mensageria:

![image](https://github.com/user-attachments/assets/40cdd30d-7783-49ed-a563-ef9697e7173b)


















