

---
## Secrets à configurer dans GitHub

Dans Settings > Secrets and Variables > Actions :



PYPI_API_TOKEN → le token PyPI ou TestPyPI (selon le contexte)

Si tu veux publier dans les deux, tu peux aussi créer :

PYPI_API_TOKEN

TEST_PYPI_API_TOKEN

et adapter l’action pour choisir dynamiquement