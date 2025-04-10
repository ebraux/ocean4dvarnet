# Installing

Python Version: 

- Python (> 3.9)

We require at least Python 3.9.

---
# Installation

We currently do not provide a conda build package of Ocean4DVarNet but only a pypi

Ocean4DVarNet is based on CUDA/Pytorch. It can be quiet complicated to install this environement from pypi package.

So the suggested installation is through mamba/conda for the CUDA/Pytorch environment, and  then pip form other dependencies.

For Linux the process to make and use a mamba/conda environment is as follows :
``` bash
mamba create --name "ocean-code" python=3.12 -y
mamba activate ocean-code
```
Then the requirements must be installed in the environment :
``` bash
mamba env update -f environment.yaml
```

---
## Instructions

To install the package, you can use the following command:
``` bash
pip install ocean4dvarnet
```
or
``` bash
python -m pip install ocean4dvarnet
```


You can also get a zip or tgz archive of the package from github repository https://github.com/CIA-Oceanix/ocean4dvarnet/releases
``` bash
pip install ocean4dvarnet-contrib-x.x.x.tar.gz
```

And you can use the last development version direcly from github repository
``` bash
pip install git+https://github.com/CIA-Oceanix/ocean4dvarnet.git
```

