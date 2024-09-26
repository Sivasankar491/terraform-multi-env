resource "aws_instance" "Expense" {
    for_each = var.instance-type
    ami = data.aws_ami.expense_instances_ami.id
    instance_type = each.value
    vpc_security_group_ids = [ aws_security_group.Expense-sg.id ]

    tags = merge(
        var.common-tags,
       # var.env-type,
        {
            Name = each.key
        }   
    )
}

resource "aws_security_group" "Expense-sg" {
    name = "Allow-ssh-${var.environment}"

     egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        var.common-tags,  
       # var.env-type,
        {
            Name = "allow_ssh-${var.environment}"
        }
    )
}