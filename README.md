# Git + Flakes + Home Manager Showcase

This repository showcases my Git + Flakes + Home Manager setup, providing
a comprehensive and reproducible configuration for my personal development
environment. With this setup, I can easily manage and version control my
dotfiles, software installations, and system configurations.

## Prerequisites

Before getting started with this setup, ensure that the following prerequisites are met:

- A Unix-like operating system (Linux, macOS)
- Git is installed
- Nix package manager is installed
- Home Manager is installed

## Installation

To set up this configuration on your local machine, follow these steps:

1. Clone this repository:

```shell
git clone <repository_url>
```

2. change the directory

```shell
cd <repository_directory>
```

3. update the hardware-configuration.nix file

```shell
cp -rf cp /etc/nixos/hardware-configuration.nix ./nixos/hardware-configuration.nix
```

4. run home-manager

```shell
home-manager switch --flake .#violet@mistubatakanashi
```

### this repo is still under development
