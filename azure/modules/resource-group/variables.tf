variable "rg_name" {
  type = string
}
variable "location" {
  type = string
  default = "centralus"
}
variable "tags" {
  type        = map(string)
  default = {}
  description = "This fake company required tags to deploy Azure resources"
}
