# Terraform Project Template

A template you can use to bootstrap Terraform module projects.

## Features

## `.gitignore`

The `.gitignore` is configured for Terraform.

## `Terratest`

Teratest support for running the module's unit tests.

## `tfenv`

The `Dockerfile` used to run the pipeline locally provides `tfenv` which can
install on demand the Terraform version stated in `module/versions.tf`.

## Directories

- `examples/` for examples on how to use the modules which will also be used during tests
- `module/` for module's source code
- `test/` for module's test source code (using terratest)

## License

GNU General Public License Version 3, 29 June 2007.

## Pipeline

Github actions for linting and testing setup.
