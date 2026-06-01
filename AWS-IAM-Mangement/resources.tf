# Creating IAM Users

resource "aws_iam_user" "IAM_Users" {

  for_each = toset(local.user_data[*].username)
  name     = each.value
}

# Creating Login Profile for users

resource "aws_iam_user_login_profile" "login_profile" {
  for_each        = aws_iam_user.IAM_Users
  user            = each.value.name
  password_length = 12

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}


# Attaching the User Policy 

resource "aws_iam_user_policy_attachment" "iam_policy" {

  for_each = {
    for pair in local.user_role_pair :
    "${pair.username}-${pair.role}" => pair
  }

  user       = aws_iam_user.IAM_Users[each.value.username].name
  policy_arn = "arn:aws:iam::aws:policy/${each.value.role}"

}

