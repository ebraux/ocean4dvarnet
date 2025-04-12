# Contributing

Thank you for your interest in Ocean4DVarNet! This guide will show you how to contribute to the Ocean4DVarNet package.


These include general guidelines for contributions to Ocean4DVarNet, instructions on setting up a development environment, and guidelines on collaboration on GitHub, writing documentation, testing, and code style.


***Unit tests***

Ocean4DVarNet include unit tests that can be executed locally using pytest. For more information on testing, please refer to the general Ocean4DVarNet [testing guidelines](./contributing/testing.md).


---
## Developing in Ocean4DVarNet

For contributing to the development of the Ocean4DVarNet packages, please follow these steps:

1. Fork the Ocean4DVarNet repository on GitHub to your personal/organisation account. See the [GitHub tutorial](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
2. Set up the development environment following the instructions in the [Development Set-up section](./developing.md)
3. ).
4. Create a new branch for your developments, following the [Branching Guidelines](./contributing/guidelines.md#branching-guidelines).
5. Make your changes and ensure that your changes adhere to the [Development Guidelines](./contributing/guidelines.md#development-guidelines).
6. Commit your changes and push your branch to your fork on GitHub.
7. Open a Pull Request against the main branch of the original repository, set a PR title according to the [PR Title Guidelines](./contributing/guidelines.md#pr-title-guidelines) and fill in the Pull Request template.
8. Request a review from maintainers or other contributors, which will follow the [Code Review Process](./contributing/contributing.md#code-review-process).


---
## Code Review Process

The Ocean4DVarNet packages have a set of automated checks to enforce coding guidelines. These checks are run via GitHub Actions on every Pull Request. For security reasons, maintainers must review code changes before enabling automated checks.

1. Ensure that all the Development Guidelines criteria are met before submitting a Pull Request.
2. Request a review from maintainers or other contributors, noting that support is on a best-efforts basis.
3. After an initial review, a maintainer will enable automated checks to run on the Pull Request.
4. Reviewers may provide feedback or request changes to your contribution.
5. Once approved, a maintainer will merge your Pull Request into the appropriate branch.


---
## Code of conduct

Please follow the [GitHub Code of Conduct](https://docs.github.com/en/site-policy/github-terms/github-community-code-of-conduct) for respectful collaboration.


---
## Sources

- [https://anemoi.readthedocs.io/en/latest/contributing/contributing.html#contributing](https://anemoi.readthedocs.io/en/latest/contributing/contributing.html#contributing)