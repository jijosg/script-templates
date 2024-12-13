# Script-templates
This repository contains templates for files to get kick-started. These are some of the files I intend to use daily.
I created this repository as I would often go and search for these information. Some of these have been lifted from other repositories, blogs and documentation.

Directory structure

```bash
.
├── LICENSE
├── README.md
├── docker
│   └── create-custom-user-ubuntu
|   └── create-custom-user-alipne
|   └── README.md
└── shell
    ├── boilerplate.sh
    ├── check-weather.sh
    └── getopts.sh

2 directories, 6 files
```

## Shell script utilities

This repository provides several shell script utilities to help you get started with common tasks:

* `shell/boilerplate.sh`: A starting point for creating new bash scripts with error handling and argument parsing.
* `shell/check-weather.sh`: Check the weather for different cities using the wttr.in service.
* `shell/getopts.sh`: Demonstrates how to use getopts for parsing command-line arguments.

## Repository management

This repository also provides utilities for managing your repository:

* GitHub Actions workflow in `.github/workflows/update-docker-tag.yml`: Automates the process of keeping Docker images up to date.
* CLI helper commands in `docker/README.md`: Manage Docker volumes, images, and system cleanup.
* Follow the directory structure and organization in `README.md` to maintain a clean and well-documented repository.
