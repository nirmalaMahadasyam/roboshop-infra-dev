module "mysql_sg" { // for mysql for sg
    source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "mysql"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.mysql_sg_tags
}

module "bastion_sg" { // for bastion for sg--->employes can connect and check
    source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "bastion"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    sg_tags = var.bastion_sg_tags
}

module "node_sg" { // for eks nodes for sg
    source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "node"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.node_sg_tags
}

module "eks_control_plane_sg" {// for master(eks_control_plane) for sg
    source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "eks-control-plane"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.node_sg_tags
}

module "ingress_alb_sg" { // ingress_app_loadbalencer for sg
    source = "git::https://github.com/daws-81s/terraform-aws-security-group.git?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = "ingress-alb"
    vpc_id = local.vpc_id
    common_tags = var.common_tags
    #sg_tags = var.node_sg_tags
}

resource "aws_security_group_rule" "ingress_alb_https" { // allowing traffic... ingress from https(public)
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.ingress_alb_sg.id
}

resource "aws_security_group_rule" "node_ingress_alb" {// allowing traffic---node from ingress_alb.node always chage the ports so we allowing some ports

  type              = "ingress"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  source_security_group_id = module.ingress_alb_sg.id
  security_group_id = module.node_sg.id
}

resource "aws_security_group_rule" "node_eks_control_plane" {// allowing traffic from node to eks_control_plane and eks_control_plane to nodes allowing full traffic.
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.eks_control_plane_sg.id
  security_group_id = module.node_sg.id
}

resource "aws_security_group_rule" "eks_control_plane_node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.node_sg.id
  security_group_id = module.eks_control_plane_sg.id
}

resource "aws_security_group_rule" "eks_control_plane_bastion" {// allowing traffic ... eks_control_plane from bastion ...bastion is a eks client.it will helps to connect eks cluster(kubectl cmds)
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.eks_control_plane_sg.id
}

resource "aws_security_group_rule" "node_vpc" {// node from vpc ...pod1(node1),pod2(node2)...so pod to pod connection also happen.
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks = ["10.0.0.0/16"] // this is pod to pod communication.node to node is internal communication
  security_group_id = module.node_sg.id
}

resource "aws_security_group_rule" "node_bastion" { // node from bastion
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.node_sg.id
}

resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id       = module.bastion_sg.id
  security_group_id = module.mysql_sg.id
}


resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"] //our company ip address which they need to allow
  security_group_id = module.bastion_sg.id
}

resource "aws_security_group_rule" "mysql_node" {// pod to get the connections with mysql
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.node_sg.id
  security_group_id = module.mysql_sg.id
}