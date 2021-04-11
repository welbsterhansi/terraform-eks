variable "name" {
  default = "eks-natura"
  description = "Configure o nome do cluster"  
}

variable "region" {
  default     = "us-east-1"
  description = "Configure a region AWS"  
}

variable  "instance_type" {
  default     = "t2.small"
  description = "Tipo de instância EC2 usada"
}

variable  "instance_num" {
  default     = "2"
  description = "Número de instâncias EC2 usadas"
}