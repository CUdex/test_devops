# variable "image_id" {
#   type = string
# }

# variable "availability_zone_names" {
#   type    = list(string)
#   default = ["us-west-1a"]
# }

variable "tags_map" {
  type = map
  default = {
      Name = "RYU_DevOps"
      owner = "RYUCU"
  }
}