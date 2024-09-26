resource "aws_route53_record" "expense" {
    for_each = aws_instance.Expense
    zone_id = data.aws_route53_zone.expense_zone.id

    #backend.daws81s.online
    name    = each.key == "Frontend-Prod" ? data.aws_route53_zone.expense_zone.name : "${each.key}.${data.aws_route53_zone.expense_zone.name}"
    type    = "A"
    ttl     = 1
    records = startswith(each.key, "Frontend") ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true
}

