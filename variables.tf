variable name {
    description = "Defining names for the Instances"
    default = [ "k8-Master", "k8-Slave1", "k8-slave2"]
}

variable instance_type {
    default = "t2.medium"
}

variable ami {
    default = "ami-0f5ee92e2d63afc18"
}