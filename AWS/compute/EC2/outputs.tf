output instance_id {
value = aws_instance.Testing-Server.*.id
}


output public_dns {
value = aws_instance.Testing-Server.*.public_dns
}
