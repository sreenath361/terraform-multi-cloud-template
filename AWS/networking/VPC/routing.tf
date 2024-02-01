resource "aws_route_table" "public-routing-table" {
    vpc_id = aws_vpc.Bosch-Dev.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Bosch-Dev-IGW.id
    }

    tags = {
        Name = "Bosch-Dev-Public-Routing-Table"
    }
}

resource "aws_route_table" "private-routing-table" {
    vpc_id = aws_vpc.Bosch-Dev.id

    tags = {
        Name = "Bosch-Dev-Private-Routing-Table"
    }
}

resource "aws_route_table_association" "public-routing-association" {
    count= length(var.publiccidrs)
    subnet_id = "${element(aws_subnet.Bosch-Dev-Public-Subnets.*.id, count.index)}"
    route_table_id = "${aws_route_table.public-routing-table.id}"
}

resource "aws_route_table_association" "private-routing-association" {
    count= length(var.privatecidrs)
    subnet_id = "${element(aws_subnet.Bosch-Dev-Private-Subnets.*.id, count.index)}"
    route_table_id = "${aws_route_table.private-routing-table.id}"
}
