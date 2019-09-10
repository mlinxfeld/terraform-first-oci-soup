variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key" {}
variable "compartment_ocid" {}
variable "region" {}
variable "private_key_oci" {}
variable "public_key_oci" {}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "VCNname" {
  default = "FoggyKitchenVCN"
}

variable "ADs" {
  default = ["pnkC:EU-FRANKFURT-1-AD-1", "pnkC:EU-FRANKFURT-1-AD-2", "pnkC:EU-FRANKFURT-1-AD-3"]
}

variable "Shapes" {
 default = ["VM.Standard1.1","VM.Standard1.2","VM.Standard1.4","VM.Standard1.8","VM.Standard1.4","VM.Standard1.16","BM.HighIO1.36","BM.DenseIO1.36","BM.RACLocalStorage1.72","Exadata.Quarter1.84","Exadata.Half1.168","Exadata.Full1.336"]
}

variable "Images" {
 # Oracle-Linux-7.5-2018.05.09-1 in Frankfurt
 default = ["ocid1.image.oc1.eu-frankfurt-1.aaaaaaaazregkysspxnktw35k4r5vzwurxk6myu44umqthjeakbkvxvxdlkq"]
}

