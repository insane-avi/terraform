variable "budget_name" {
  type = string
}

variable "limit_amount" {
  type = number
}

variable "email_address" {
  type = string
}

variable "time_unit" {
  type    = string
  default = "MONTHLY"
}

variable "threshold" {
  type    = number
  default = 80
}
