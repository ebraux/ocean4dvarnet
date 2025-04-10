# Configuration d'un environnement de base

Installation d'un environnement Conda/Mamba/pip complètement autonome.

Avec ipython pour pouvoir lancer les notebook

---
## Installation de mamba

- Définition du dossier racine pour déployer l'environnement et les développements: 
ici création d'un dossier "my-dev" :
``` bash
cd $HOME
mkdir ocean-code;
cd ocean-code
# ocean-code -> OC
OC_PATH=$PWD
export OC_PATH
echo $OC_PATH
# /home/local-user/ocean-code
```

Télécharger et installer miniforge3
```bash
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-Linux-x86_64.sh -b -p "${OC_PATH}/miniforge3"
```
Activer conda et mamba
``` bash
source "${OC_PATH}/miniforge3/etc/profile.d/conda.sh"
source "${OC_PATH}/miniforge3/etc/profile.d/mamba.sh"
```

- Configurer l'environnement Conda par défaut
``` bash
conda config --system --set channel_priority strict
conda config --system --remove-key channels
conda config --system --add channels  defaults
conda config --system --prepend channels conda-forge
conda config --system --remove channels  defaults
conda config --system --append channels  nodefaults
```

---
## Création d'un environnement

- Créer l'environnement : Attention, choisir la version de python qui correspond
``` bash
mamba create --name "ocean-code" python=3.12 -y
```
- Installer pip
``` bash
mamba install pip
```
- Afficher les versions de python avant activation de l'environnement
``` bash
python3 --version
# Python 3.10.12

which python3
# /usr/bin/python3

python3 -m pip --version
pip 25.0.1 from /home/local-user/.local/lib/python3.10/site-packages/pip (python 3.10)
```
- Activer l'environnement
``` bash
mamba activate ocean-code
```
- Vérifier que ce sont bien les version de python et pip de l'environnement qui sont utilisées
``` bash
python3 --version
# Python 3.12.9

which python3
# /home/local-user/my-dev/miniforge3/envs/ocean-code/bin/python3

```
- Configurer Conda pour cet env
``` bash
conda config --env --set channel_priority flexible
conda config --env --remove-key channels
conda config --env --add channels  defaults
conda config --env --prepend channels conda-forge
conda config --env --remove channels  defaults
conda config --env --append channels  nodefaults
```

---
## Configuration de pip

### Gestion du cache

- Configuration
``` bash
mkdir -p ${OC_PATH}/miniforge3/pip/cache

pip config --site set global.cache-dir  ${OC_PATH}/miniforge3/pip/cache
# Writing to /home/local-user/my-dev/miniforge3/envs/4Dvarnet-test/pip.conf
```
- Vérification
``` bash
pip cache dir
# /home/local-user/my-dev/miniforge3/pip/cache
```
``` ini
[install]
no-user = true
```

---
## Vérification de la configuration

Les package et versions peuvent être différentes en fonction des version de python. Mais les listes des paquets installé via mamba et pip doivent êtr proches des listes ci dessous :

- mamba
``` bash
mamba list
# # packages in environment at /home/ebraux/_LOCAL/mee/ocean/ocean-code/miniforge3/envs/ocean-code:
# #
# # Name                    Version                   Build  Channel
# _libgcc_mutex             0.1                 conda_forge    conda-forge
# _openmp_mutex             4.5                       2_gnu    conda-forge
# bzip2                     1.0.8                h4bc722e_7    conda-forge
# ca-certificates           2025.1.31            hbcca054_0    conda-forge
# ld_impl_linux-64          2.43                 h712a8e2_4    conda-forge
# libexpat                  2.6.4                h5888daf_0    conda-forge
# libffi                    3.4.6                h2dba641_0    conda-forge
# libgcc                    14.2.0               h767d61c_2    conda-forge
# libgcc-ng                 14.2.0               h69a702a_2    conda-forge
# libgomp                   14.2.0               h767d61c_2    conda-forge
# liblzma                   5.6.4                hb9d3cd8_0    conda-forge
# libnsl                    2.0.1                hd590300_0    conda-forge
# libsqlite                 3.49.1               hee588c1_2    conda-forge
# libuuid                   2.38.1               h0b41bf4_0    conda-forge
# libxcrypt                 4.4.36               hd590300_1    conda-forge
# libzlib                   1.3.1                hb9d3cd8_2    conda-forge
# ncurses                   6.5                  h2d0b736_3    conda-forge
# openssl                   3.4.1                h7b32b05_0    conda-forge
# pip                       25.0.1             pyh8b19718_0    conda-forge
# python                    3.12.9          h9e4cc4f_1_cpython    conda-forge
# readline                  8.2                  h8c095d6_2    conda-forge
# setuptools                75.8.2             pyhff2d567_0    conda-forge
# tk                        8.6.13          noxft_h4845f30_101    conda-forge
# tzdata                    2025b                h78e105d_0    conda-forge
# wheel                     0.45.1             pyhd8ed1ab_1    conda-forge
```
- pip
``` bash
pip freeze
# setuptools==75.8.2
# wheel==0.45.1
```
---
## Installation de CUDA + pytorch

`mamba` permet d'installer les package manuellement, mais la bonne pratique est l'utilisation d'un fichier d'environnement : `environment.yaml`

- créer le fichier `environment.yaml`
``` yaml
channels:
  - conda-forge
  - pytorch
  - nvidia
  - nodefaults
dependencies:
  - pip
  - pytorch::pytorch
  - pytorch::pytorch-cuda
  - pyinterp
  - tqdm
```
- et lancer la mise à jour de l'environnement (prend du temps)
``` bash
mamba env update -f environment.yaml
```

Les messages de type ci dessous sont liés à un problème de connexion Internet, il suffit de relancer la commande.
``` bash
CondaSSLError: Encountered an SSL error. Most likely a certificate verification issue.
...
CondaHTTPError: HTTP 000 CONNECTION FAILED for url <https://conda.anaconda.org/conda-forge/linux-64/libcufft-11.2.1.3-he02047a_2.conda>
...
An HTTP error occurred when trying to retrieve this URL. HTTP errors are often intermittent, and a simple retry will get you on your way.
```

---
## Jupyterlab pour les Notebook

``` bash
pip install jupyterlab
``` 

