# Development Set-up




Thank you for your interest in Ocean4DVarNet ! Please follow the general Ocean4DVarNet [contributing guidelines](./contributing/index.md).

These include general guidelines for contributions to Ocean4DVarNet, instructions on setting up a development environment, and guidelines on collaboration on GitHub, writing documentation, testing, and code style.

***Unit tests***

Ocean4DVarNet include unit tests that can be executed locally using pytest. For more information on testing, please refer to the general Ocean4DVarNet [testing guidelines](./contributing/testing.md).

To create a development environment follow the steps outlined below.

---
## Setting Up Your Fork

When working with a fork, follow these steps to set up your local development environment:

1. Fork the repository: Create your own copy of the repository on GitHub, following this [GitHub forking a repository tutorial](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#forking-a-repository).
2. Clone your fork: Download your forked repository to your local machine as outlined in [this section of the tutorial](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#cloning-your-forked-repository).
3. Add the upstream remote: Connect your local repository to the original repository to fetch updates as described [in this section](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#configuring-git-to-sync-your-fork-with-the-upstream-repository).
4. Prevent accidental pushes to upstream: After setting up your fork and configuring the original repository as an upstream remote, it’s a good practice to prevent accidental pushes to the upstream repository. You can do this by explicitly setting the push URL of the upstream remote to no_push. To do this, navigate to your local repository and run:
``` bash
git remote set-url --push upstream no_push
```
Verify the change with
``` bash
git remote -v
```
You should see something like this:
``` bash
origin    https://github.com/your-username/repository.git (fetch)
origin    https://github.com/your-username/repository.git (push)
upstream  https://github.com/original-owner/repository.git (fetch)
upstream  no_push (push)
```

With this configuration, you can still fetch updates from the upstream repository but won’t be able to accidentally push changes to it.

1. Create and activate a virtual environment with a python version >=3.9, and <3.12.
2. Navigate to the repository you cloned and for which you want to install the dependencies.
``` bash
cd ocean4dvarnet
```
3. Install package dependencies
``` bash
pip install -e .
```
4. Install developement dependencies
``` bash
pip install -e .[dev]
```


---
## Install development 

To install the most recent development version, install from github:

https://github.com/CIA-Oceanix/ocean4dvarnet.git
git@github.com:CIA-Oceanix/ocean4dvarnet.git


---
## Testing

To run the test suite after installing Ocean4DVarNet : 

Install dev dependencies (pylint, pytest, ...) in the models directory of the Ocean4DVarNet repository.
``` bash
pip install .[dev]
```

And the run :

``` bash
pylint

pytest
```

---
## Sources

- [https://anemoi.readthedocs.io/en/latest/contributing/environment.html#setting-up-the-development-environment](https://anemoi.readthedocs.io/en/latest/contributing/environment.html#setting-up-the-development-environment)
- [https://anemoi.readthedocs.io/en/latest/contributing/testing.html#testing-guidelines](https://anemoi.readthedocs.io/en/latest/contributing/testing.html#testing-guidelines)