terraform {}

locals {
  value = "Hello World"
}

variable "string_list" {
  type    = list(string)
  default = ["server-1", "server-2", "server-3"]

}

output "output" {
  # value = upper(local.value)
  #   value = startswith(local.value,"Shalin")
  # value = split(" ", local.value)
  value = max(1, 2, 3, 4, 5, 6)
}
