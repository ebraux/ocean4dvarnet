# Welcome to ocean4DVarNet documentation! 

***Warning: This documentation is a work in progress.***

---
## About ocean4DVarNet

**4DVarNet** (short for **4D-Variational Network**) is a deep learning-based framework that combines ideas from data assimilation (specifically **4D-Var**) with neural networks to reconstruct high-resolution spatiotemporal data from incomplete and noisy observations—commonly applied in **Earth sciences**, like oceanography and meteorology.


### **Core Concept**

4DVarNet blends:
- **4D-Variational data assimilation (4D-Var)**: A method used to optimally combine a numerical model with observations over a time window.
- **Deep learning**: Neural networks learn to model complex dynamics and correct for model errors.
  
It learns to **reconstruct missing data** over both space and time (the "4D" stands for 3D space + time).


### **How It Works**

- It uses a neural network **within a variational optimization loop**.
- Given **partial observations** (like satellite data), it:
    1. Predicts the full state over time.
    2. Minimizes a **loss function** that balances between:
        - Staying close to the observations.
        - Being consistent with a learned dynamical prior (the network).
    3. Refines its predictions iteratively (like traditional 4D-Var).


### Applications

- **Oceanographic reconstructions** (e.g. Sea Surface Height fields).
- **Climate modeling**.
- **Atmospheric reanalysis**.
- Any setting where data is sparse, noisy, and spatiotemporal.



---
## Installing

To install the package, you can use the following command:
``` bash
pip install ocean4dvarnet
```

Get more information in the [installing](./installing.md) section.

---
## Contributing

``` bash
git clone ...
cd ocean4dvarnet
pip install .[dev]
```

Get more information in the [contributing](./contributing.md) section.

---
## License

...

- Installation d'un environmment python
    - [Installation basique](./basic_env.md)
    - [Installation détaillée d'un environnement complet](./ocean-code_env.md)
- Installation du package



