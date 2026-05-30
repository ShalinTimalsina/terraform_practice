terraform {

}

variable "num_list" {

  type    = list(number)
  default = [1, 2, 3, 4, 5]

}

variable "map_list" {
  type = map(number)
  default = {
    "One"   = 1
    "two"   = 2
    "three" = 3
  }

}

variable "person_list" {

  type = list(object({
    fname = string
    lname = string
    age   = number
  }))

  default = [{
    fname = "Shalin"
    lname = "Timalsina"
    age   = 20
    },
    {
      fname = "Srizan"
      lname = "Neupane"
      age   = 19
  }]



}
# Calculations
locals {
  add = 2 + 6
  mul = 2 * 10
  eq  = 2 == 3


  double_num = [for i in var.num_list : i * 2]

  odd_num = [for i in var.num_list : i if i % 2 != 0]

  fname_list = [for person in var.person_list : person.fname]

    # work with map

    map_info = [for key, value in var.map_list : key ]

    # Double map 
    d_map = {for key, value in var.map_list : key => value * 2 }
}



output "mul" {
  value = local.mul
}

output "add" {
  value = local.add
}

output "eq" {
  value = local.eq
}

output "numlist" {
  value = var.num_list
}


# double the num list
output "double_numlist" {
  value = local.double_num
}

output "odd_numlist" {

  value = local.odd_num
}

output "fname_person_list" {

  value = local.fname_list

}


output "map_info" {

  value = local.d_map

}




