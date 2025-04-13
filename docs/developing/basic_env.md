# Installation

- Package that need build with wheel : with mamba (conda)
    -  CUDA + Pytorch 
- Other packages : pip + requirement in pyproject.toml


Pour une [documentation d'installation plus détaillée](./ocean-code_env.md)

---
## Création de l'environnement mamba

- Créer l'environnement : Attention, choisir la version de python qui correspond
``` bash
mamba create --name "ocean-code" python=3.12 -y
```
- Installer pip
``` bash
mamba install pip
```


- Activer l'environnement
``` bash
mamba activate ocean-code
```
- afficher le contenu du fichier environment.yaml
``` bash
cat environment.yaml
```
- Et lancer la mise à jour de l'environnement (prend du temps)
``` bash
mamba env update -f environment.yaml
```
