variable "flux_manage" {
  default = true
}
variable "flux_git_https_key" {
  default = "ghp_"
}
variable "flux_git_url" {
  type    = string
  default = "https://github.com/Rockwell-Automation-FTDS/fluxcd-empty"
}
variable "flux_git_reference_value" {
  type    = string
  default = "main"
}
