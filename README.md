![Platforms](https://img.shields.io/badge/%20Platforms-Windows%20/%20Linux-blue.svg?style=flat-square")
[![License](https://img.shields.io/badge/%20Licence-MIT-green.svg?style=flat-square)](LICENSE.md)
[![Code Of Conduct](https://img.shields.io/badge/Community-Code%20of%20Conduct-orange.svg?style=flat-squre)](CODE_OF_CONDUCT.md)
[![Support](https://img.shields.io/badge/Community-Support-red.svg?style=flat-square)](SUPPORT.md)
[![Contributing](https://img.shields.io/badge/%20Community-Contribution-yellow.svg?style=flat-square)](CONTRIBUTING.md)

<hr>

# Terraform Docker

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v1.4%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

Docker provisioner using terraform. Installing docker engine on cloud or self-hosted on-premise infrastructure such as Bare Metal or Virtual Machine in various Hypervisor. 

## Requirements

| Name | Version |
| ---- | ------- |
| [Terraform](https://www.terraform.io/downloads.html) |  >= 1.0.11 |

## Getting Started

There are instructions under `demo` directory will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Usage

Deploy on self-hosted VM

```shell
module "docker" {
  source          = "bayudwiyansatria/bootstrap/docker"
  server_ips      = var.server_ips
  ssh_private_key = var.cluster_admin_ssh_access
}
```

```shell
module "docker" {
  source          = "bayudwiyansatria/bootstrap/docker"
  server_ips      = [
		192.168.1.2,
		192.168.1.3,
		192.168.1.4
	]
  ssh_private_key = var.cluster_admin_ssh_access
}
```

### Variables

| Name | Default | Description | Required |
| ---- | ------- | ----------- | -------- |
| server_ips | `[]` | List String of Server IP addresses | true |
| ssh_private_key | `~/.ssh/id_rsa` | SSH Private Key | true |
| docker_version | `20.10.11` | Docker Version | true |

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

Looking to contribute to our code but need some help? There's a few ways to get information:

* Connect with us on [Twitter](https://twitter.com/bayudsatria)
* Like us on [Facebook](https://facebook.com/PBayuDSatria)
* Follow us on [LinkedIn](https://linkedin.com/in/bayudwiyansatria)
* Subscribe us on [Youtube](https://youtube.com/channel/UCihxWj1rtheK73mGdrf0OiA)
* Log an issue here on github

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/bayudwiyansatria/Development-And-Operations/tags).

## Authors

- [Bayu Dwiyan Satria](https://github.com/bayudwiyansatria)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

<p> Copyright &copy; 2021. All Rights Reserved.

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
