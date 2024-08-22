variable ami {
    description = "The ami used for this instance"
    type = string
    default = "ami-04a81a99f5ec58529"
}

variable ec2type {
    description = "The instance type to be used"
    type = string
    default = "t2.micro"
}

variable az1 {
    description = "AZ for public subnet"
    type = string
    default = "us-east-1a"
}

variable "az2" {
    description = "AZ for private subnet"
    type = string
    default = "us-east-1b"
  
}