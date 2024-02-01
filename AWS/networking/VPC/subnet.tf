# Create subnets
resource "aws_subnet" "Bosch-Dev-Public-Subnets" {
    count= length(var.publiccidrs)
    vpc_id = aws_vpc.Bosch-Dev.id
    cidr_block = "${element(var.publiccidrs, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
        Name = "Bosch-Dev-Public-Subnet-${count.index+1}"
    }
}

resource "aws_subnet" "Bosch-Dev-Private-Subnets" {
    count= length(var.privatecidrs)
    vpc_id = aws_vpc.Bosch-Dev.id
    cidr_block = "${element(var.privatecidrs, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
        Name = "Bosch-Dev-Private-Subnet-${count.index+1}"
    }
}
