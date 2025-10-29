---
title: "Numpy, la brique de base de la data science"
title-en: "Numpy, the foundation of data science"
author: Lino Galiana
description: |
  `Numpy` constitue la brique de base de l'écosystème de la _data science_ en `Python`. Toutes les librairies de manipulation de données, de modélisation et de visualisation reposent, de manière plus ou moins directe, sur `Numpy`. Il est donc indispensable de revoir quelques notions sur ce package avant d'aller plus loin.
description-en: |
  `Numpy` is the cornerstone of the _data science_ ecosystem in `Python`. All data manipulation, modeling, and visualization libraries rely, directly or indirectly, on `Numpy`. It is therefore essential to review some concepts of this package before moving forward.
image: scatter_numpy.png
echo: false
---

{{< badges
    printMessage="true"
>}}

:::: {.content-visible when-format="ipynb"}
::: {.warninglang .callout-warning}
:::
::::

# Introduction

::: {.content-visible when-profile="fr"}

Ce chapitre constitue une introduction à _Numpy_ pour
s'assurer que les bases du calcul vectoriel avec `Python`
soient maîtrisées. La première partie du chapitre
présente des petits exercices pour pratiquer quelques fonctions basiques de `Numpy`. La fin du chapitre présente
des exercices pratiques d'utilisation de `Numpy` plus approfondis.

Il est recommandé de régulièrement se référer à
la [_cheatsheet numpy_](https://www.datacamp.com/community/blog/python-numpy-cheat-sheet) et à la
[doc officielle](https://numpy.org/doc/stable/) en cas de doute
sur une fonction. 

Dans ce chapitre, on ne dérogera pas à la convention qui s'est imposée
d'importer `Numpy` de la
manière suivante :

:::

::: {.content-visible when-profile="en"}
This chapter serves as an introduction to _Numpy_ to ensure that the basics of vector calculations with `Python` are mastered. The first part of the chapter presents small exercises to practice some basic functions of `Numpy`. The end of the chapter presents more in-depth practical exercises using `Numpy`.

It is recommended to regularly refer to the [_numpy cheatsheet_](https://www.datacamp.com/community/blog/python-numpy-cheat-sheet) and the [official documentation](https://numpy.org/doc/stable/) if you have any doubts about a function.

In this chapter, we will adhere to the convention of importing `Numpy` as follows:
:::

::: {#import-np .cell}
``` {.python .cell-code}
import numpy as np
```
:::


::: {.content-visible when-profile="fr"}
Nous allons également fixer la racine du générateur aléatoire de nombres
afin d'avoir des résultats reproductibles :
:::

::: {.content-visible when-profile="en"}
We will also set the seed of the random number generator to obtain reproducible results:
:::

::: {#fc49b95e .cell}
``` {.python .cell-code}
import numpy as np
rng = np.random.default_rng(seed=12345)
```
:::


::: {.content-visible when-profile="fr"}

::: {.callout-caution}

Historiquement, la génération de nombres aléatoires se faisait pas le biais du package `numpy.random`. Néanmoins, les auteurs de `Numpy` [recommandent maintenant](https://numpy.org/doc/stable/reference/random/index.html) d'utiliser plutôt des générateurs pour cela. Les exemples de ce tutoriel adoptent donc cette pratique.

:::

:::

:::: {.content-visible when-profile="en"}

::: {.callout-caution}

Historically, random numbers were generated using the `numpy.random` package. However, the authors of `Numpy` [now recommend](https://numpy.org/doc/stable/reference/random/index.html) using generators instead. The examples in this tutorial adopt this practice.

:::

::::

::: {.content-visible when-profile="fr"}



# Le concept d'_array_

Dans le monde de la science des données, comme cela sera évoqué
plus en profondeur dans les prochains chapitres, 
l'objet central est le tableau à deux dimensions de données.
La première correspond aux lignes et la seconde aux colonnes. 
Si on ne se préoccupe que d'une dimension, on se rapporte 
à une variable (une colonne) de notre tableau de données. 
Il est donc naturel de faire le lien entre les
tableaux de données et l'objet mathématique
que sont les matrices et les vecteurs. 

`NumPy` (`Numerical Python`) est la brique de base
pour traiter des listes numériques ou des chaines
de textes comme des matrices.
`NumPy` intervient pour proposer
ce type d'objets, et
les opérations standardisées associées qui n'existent
pas dans le langage `Python` de base. 

L'objet central de `NumPy` est
l'**`array`** qui est un tableau de données multidimensionnel.
L'array `Numpy` peut être unidimensionnel et s'apparenter à un
vecteur (`1d-array`),
bidimensionnel et ainsi s'apparenter à une matrice (`2d-array`) ou,
de manière plus générale, 
prendre la forme d'un objet
multidimensionnel (`Nd-array`), sorte de tableau emboîté. 

Les tableaux simples (uni ou bi-dimensionnels) sont faciles à se représenter
et représentent la majorité des besoins liés à `Numpy`. 
Nous découvrirons lors du chapitre suivant, sur `Pandas`, qu'en pratique
on manipule rarement directement `Numpy` qui est une librairie
bas niveau. 
Un _DataFrame_ `Pandas` sera construit à partir d'une collection
d'array uni-dimensionnels (les variables de la table), ce qui permettra d'effectuer des opérations cohérentes
(et optimisées) avec le type de la variable.
Avoir quelques notions `Numpy` est utile pour comprendre
la logique de manipulation vectorielle
rendant les traitements sur des données plus lisibles,
plus efficaces et plus fiables.

Par rapport à une liste,

* un *array* ne peut contenir qu'un type de données (`integer`, `string`, etc.),
contrairement à une liste.
* les opérations implémentées par `Numpy` seront plus efficaces et demanderont moins
de mémoire

Les données géographiques constitueront une construction un peu plus complexe qu'un `DataFrame` traditionnel. 
La dimension géographique prend la forme d'un tableau plus profond, au moins bidimensionnel
(coordonnées d'un point). Néanmoins, les librairies de manipulation
de données géographiques permettront de ne pas se préoccuper de
cette complexité accrue.

:::

::: {.content-visible when-profile="en"}
# Concept of _array_

In the world of data science, as will be discussed in more depth in the upcoming chapters, the central object is the two-dimensional data table. The first dimension corresponds to rows and the second to columns. If we only consider one dimension, we refer to a variable (a column) of our data table. It is therefore natural to link data tables to the mathematical objects of matrices and vectors.

`NumPy` (`Numerical Python`) is the foundational brick for processing numerical lists or strings of text as matrices. `NumPy` comes into play to offer this type of object and the associated standardized operations that do not exist in the basic `Python` language.

The central object of `NumPy` is the **`array`**, which is a multidimensional data table. A `Numpy` array can be one-dimensional and considered as a vector (`1d-array`), two-dimensional and considered as a matrix (`2d-array`), or, more generally, take the form of a multidimensional object (`Nd-array`), a sort of nested table.

Simple arrays (one or two-dimensional) are easy to represent and cover most of the use-case related to `Numpy`. We will discover in the next chapter on `Pandas` that, in practice, we usually don't directly use  `Numpy` since it is a low-level library. A `Pandas` _DataFrame_ is constructed from a collection of one-dimensional arrays (the variables of the table), which allows performing coherent (and optimized) operations with the variable type. Having some `Numpy` knowledge is useful for understanding the logic of vector manipulation, making data processing more readable, efficient, and reliable.

Compared to a list,

* an *array* can only contain one type of data (`integer`, `string`, etc.), unlike a list.
* operations implemented by `Numpy` will be more efficient and require less memory.

Geographical data will constitute a slightly more complex construction than a traditional `DataFrame`. The geographical dimension takes the form of a deeper table, at least two-dimensional (coordinates of a point). However, geographical data manipulation libraries will handle this increased complexity.
:::


::: {.content-visible when-profile="fr"}

## Créer un array

On peut créer un _array_ de plusieurs manières. Pour créer un _array_ à partir d'une liste,
il suffit d'utiliser la méthode `array`:

:::

::: {.content-visible when-profile="en"}
## Creating an array

We can create an array in several ways. To create an array from a list, simply use the `array` method:

:::

::: {#28d43a0c .cell}
``` {.python .cell-code}
np.array([1,2,5])
```
:::


::: {.content-visible when-profile="fr"}

Il est possible d'ajouter un argument `dtype` pour contraindre le type du *array* :

:::

::: {.content-visible when-profile="en"}
It is possible to add a `dtype` argument to constrain the array type:
:::

::: {#62de9636 .cell}
``` {.python .cell-code}
np.array([["a","z","e"],["r","t"],["y"]], dtype="object")
```
:::


::: {.content-visible when-profile="fr"}

Il existe aussi des méthodes pratiques pour créer des array:

* séquences logiques : `np.arange` (suite) ou `np.linspace` (interpolation linéaire entre deux bornes) ;
* séquences ordonnées : _array_ rempli de zéros, de 1 ou d'un nombre désiré : `np.zeros`, `np.ones` ou `np.full` ;
* séquences aléatoires : fonctions de génération de nombres aléatoires : `rng.uniform`, `rng.normal`, etc. où `rng` est un générateur de nombre aléatoires ;  
* tableau sous forme de matrice identité : `np.eye`.

Ceci donne ainsi, pour les séquences logiques:

:::

::: {.content-visible when-profile="en"}
There are also practical methods for creating arrays:

* Logical sequences: `np.arange` (sequence) or `np.linspace` (linear interpolation between two bounds);
* Ordered sequences: array filled with zeros, ones, or a desired number: `np.zeros`, `np.ones`, or `np.full`;
* Random sequences: random number generation functions: `rng.uniform`, `rng.normal`, etc. where `rng` is a random number generator;
* Matrix in the form of an identity matrix: `np.eye`.

This gives, for logical sequences:
:::

::: {#c0203148 .cell}
``` {.python .cell-code}
np.arange(0,10)
```
:::


::: {#6e37c5df .cell}
``` {.python .cell-code}
np.arange(0,10,3)
```
:::


::: {#299aad09 .cell}
``` {.python .cell-code}
np.linspace(0, 1, 5)
```
:::


::: {.content-visible when-profile="fr"}
Pour un _array_ initialisé à 0:
:::

::: {.content-visible when-profile="en"}
For an array initialized to 0:
:::

::: {#9f57b6ef .cell}
``` {.python .cell-code}
np.zeros(10, dtype=int)
```
:::


::: {.content-visible when-profile="fr"}
ou initialisé à 1:
:::
::: {.content-visible when-profile="en"}
or initialized to 1:
:::

::: {#e582e101 .cell}
``` {.python .cell-code}
np.ones((3, 5), dtype=float)
```
:::


::: {.content-visible when-profile="fr"}
ou encore initialisé à 3.14:
:::
::: {.content-visible when-profile="en"}
or even initialized to 3.14:
:::

::: {#bd5c2c40 .cell}
``` {.python .cell-code}
np.full((3, 5), 3.14)
```
:::


::: {.content-visible when-profile="fr"}
Enfin, pour créer la matrice $I_3$:
:::
::: {.content-visible when-profile="en"}
Finally, to create the matrix $I_3$:
:::

::: {#b42f477d .cell}
``` {.python .cell-code}
np.eye(3)
```
:::


::: {.content-visible when-profile="fr"}
::: {.callout-tip}
## Exercice 1

Générer:

* $X$ une variable aléatoire, 1000 répétitions d'une loi $U(0,1)$
* $Y$ une variable aléatoire, 1000 répétitions d'une loi normale de moyenne nulle et de variance égale à 2
* Vérifier la variance de $Y$ avec `np.var`

:::



:::

::: {.content-visible when-profile="en"}
::: {.callout-tip}
## Exercise 1

Generate:

* $X$ a random variable, 1000 repetitions of a $U(0,1)$ distribution
* $Y$ a random variable, 1000 repetitions of a normal distribution with zero mean and variance equal to 2
* Verify the variance of $Y$ with `np.var`

:::



:::


::: {.content-visible when-profile="fr"}

# Indexation et _slicing_

## Logique dans le cas d'un array unidimensionnel

La structure la plus simple est l'_array_ unidimensionnel:
:::

::: {.content-visible when-profile="en"}

# Indexing and slicing

## Logic illustrated with a one-dimensional array

The simplest structure is the one-dimensional array:
:::

::: {#756f5f32 .cell}
``` {.python .cell-code}
x = np.arange(10)
print(x)
```
:::


::: {.content-visible when-profile="fr"}

L'indexation est dans ce cas similaire à celle d'une liste: 

* le premier élément est 0
* le énième élément est accessible à la position $n-1$

La logique d'accès aux éléments est ainsi la suivante :

```python
x[start:stop:step]
```

Avec un *array* unidimensionnel, l'opération de *slicing* (garder une coupe du *array*) est très simple. 
Par exemple, pour garder les *K* premiers éléments d'un *array*, on fera:

```python
x[:K]
```

En l'occurrence, on sélectionne le K$^{eme}$ élément en utilisant

```python
x[K-1]
```

Pour sélectionner uniquement un élément, on fera ainsi:

::: {#15f54dd9 .cell}
``` {.python .cell-code}
x = np.arange(10)
x[2]
```
:::


Les syntaxes qui permettent de sélectionner des indices particuliers d'une liste fonctionnent également
avec les _arrays_.

:::

::: {.content-visible when-profile="en"}
Indexing in this case is similar to that of a list:

* The first element is 0
* The nth element is accessible at position $n-1$

The logic for accessing elements is as follows:

```python
x[start:stop:step]
```

With a one-dimensional array, the slicing operation (keeping a slice of the array) is very simple. For example, to keep the first *K* elements of an array, you would do:

```python
x[:K]
```

In this case, you select the K$^{th}$ element using:

```python
x[K-1]
```

To select only one element, you would do:

::: {#a1fd7629 .cell}
``` {.python .cell-code}
x = np.arange(10)
x[2]
```
:::


The syntax for selecting particular indices from a list also works with arrays.
:::

::: {.content-visible when-profile="fr"}
::: {.callout-tip}
## Exercice 2

Prenez `x = np.arange(10)` et...

* Sélectionner les éléments 0, 3, 5 de `x`
* Sélectionner les éléments pairs
* Sélectionner tous les éléments sauf le premier
* Sélectionner les 5 premiers éléments

:::

::: {#8fab698b .cell}
``` {.python .cell-code}
np.arange(10)
```
:::




:::

::: {.content-visible when-profile="en"}
::: {.callout-tip}
## Exercise 2

Take `x = np.arange(10)` and...

* Select elements 0, 3, 5 from `x`
* Select even elements
* Select all elements except the first
* Select the first 5 elements

:::

::: {#507afe6e .cell}
``` {.python .cell-code}
np.arange(10)
```
:::




:::

::: {.content-visible when-profile="fr"}

La logique se généralise pour les _array_ multidimensionnels. L'indexation se fait alors à plusieurs niveaux.  Prenons par exemple un array à 2 dimensions (une matrice en quelques sortes):

::: {#35f26a69 .cell}
``` {.python .cell-code}
x = np.array([[1, 2, 3], [4, 5, 6]], np.int32)
```
:::


Si on veut sélectionner la 2e ligne, 3e colonne (l'élément de valeur 6), on fait

::: {#f0ee4edb .cell}
``` {.python .cell-code}
x[1, 2]
```
:::


Maintenant, pour sélectionner une colonne complète (par exemple la 2e), on peut utiliser le 2e index pour spécifier celle-ci (index 1 en Python puisque l'indexation part de 0) puis `:` sur la première dimension (version raccourcie de `0:N`) pour ne pas discriminer selon cette dimension: 

::: {#6fdf1eb0 .cell}
``` {.python .cell-code}
x[:,1]
```
:::


Le principe se généralise, mais se complexifie, pour des _array_ imbriqués. Heureusement, ce sont des objets qu'on manipule assez rarement directement, la plupart de nos données numériques étant des tableaux plats (une valeur - l'observation - est le croisement d'une ligne - l'individu - et d'une colonne - la variable). 

:::

::: {.content-visible when-profile="en"}
The same logic applies to multidimensional _arrays_. Indexing then takes place at several levels.  Take, for example, a 2-dimensional array (a matrix of sorts):

::: {#f3e34493 .cell}
``` {.python .cell-code}
x = np.array([[1, 2, 3], [4, 5, 6]], np.int32)
```
:::


If we want to select the 2nd row, 3rd column (the element with value 6), we do

::: {#5c9e104a .cell}
``` {.python .cell-code}
x[1, 2]
```
:::


Now, to select a complete column (e.g. the 2nd), we can use the 2nd index to specify it (index 1 in Python since indexing starts from 0) and then `:` on the first dimension (shortened version of `0:N`) to avoid discriminating according to this dimension: 

::: {#3c7d1e35 .cell}
``` {.python .cell-code}
x[:,1]
```
:::


The principle is generalized, but becomes more complex, for nested _arrays_. Fortunately, these are objects we rarely manipulate directly, as most of our numerical data are flat arrays (a value - the observation - is the intersection of a row - the individual - and a column - the variable). 


:::


::: {.content-visible when-profile="fr"}

## Sur la performance

Un élément déterminant dans la performance de `Numpy` par rapport aux listes,
lorsqu'il est question de 
*slicing* est qu'un array ne renvoie pas une
copie de l'élément en question (copie qui coûte de la mémoire et du temps)
mais simplement une vue de celui-ci.

Lorsqu'il est nécessaire d'effectuer une copie,
par exemple pour ne pas altérer l'_array_ sous-jacent, on peut 
utiliser la méthode `copy`:

:::

::: {.content-visible when-profile="en"}
## Regarding performance

A key element in the performance of `Numpy` compared to lists, when it comes to slicing, is that an array does not return a copy of the element in question (a copy that costs memory and time) but simply a view of it.

When it is necessary to make a copy, for example to avoid altering the underlying array, you can use the `copy` method:

:::

```python
x_sub_copy = x[:2, :2].copy()
```

::: {.content-visible when-profile="fr"}

## Filtres logiques


Il est également possible, et plus pratique, de sélectionner des données à partir de conditions logiques
(opération qu'on appelle un __*boolean mask*__).
Cette fonctionalité servira principalement à 
effectuer des opérations de filtre sur les données.

Pour des opérations de comparaison simples, les comparateurs logiques peuvent être suffisants. 
Ces comparaisons fonctionnent aussi sur les tableaux multidimensionnels grâce au
*broadcasting* sur lequel nous reviendrons :

:::

::: {.content-visible when-profile="en"}
It is also possible, and more practical, to select data based on logical conditions (an operation called a __*boolean mask*__). This functionality will mainly be used to perform data filtering operations.

For simple comparison operations, logical comparators may be sufficient. These comparisons also work on multidimensional arrays thanks to broadcasting, which we will discuss later:
:::

::: {#a0e4ed20 .cell}
``` {.python .cell-code}
x = np.arange(10)
x2 = np.array([[-1,1,-2],[-3,2,0]])
print(x)
print(x2)
```
:::


::: {#828ee8d1 .cell}
``` {.python .cell-code}
x==2
x2<0
```
:::


::: {.content-visible when-profile="fr"}
Pour sélectionner les observations relatives à la condition logique,
il suffit d'utiliser la logique de *slicing* de `numpy` qui fonctionne avec les conditions logiques

::: {.callout-tip}
## Exercice 3

Soit 

```python
x = np.random.normal(size=10000)
```

1. Ne conserver que les valeurs dont la valeur absolue est supérieure à 1.96
2. Compter le nombre de valeurs supérieures à 1.96 en valeur absolue et leur proportion dans l'ensemble
3. Sommer les valeurs absolues de toutes les observations supérieures (en valeur absolue) à 1.96
et rapportez les à la somme des valeurs de `x` (en valeur absolue) 

:::



:::

::: {.content-visible when-profile="en"}
To select the observations related to the logical condition, just use the `numpy` slicing logic that works with logical conditions.

::: {.callout-tip}
## Exercise 3

Given

```python
x = np.random.normal(size=10000)
```

1. Keep only the values whose absolute value is greater than 1.96
2. Count the number of values greater than 1.96 in absolute value and their proportion in the whole set
3. Sum the absolute values of all observations greater (in absolute value) than 1.96 and relate them to the sum of the values of `x` (in absolute value)

:::



:::


::: {.content-visible when-profile="fr"}
Lorsque c'est possible, il est recommandé d'utiliser les fonctions logiques de `numpy` (optimisées et 
qui gèrent bien la dimension).
Parmi elles, on peut retrouver:

* `count_nonzero` ;
* `isnan` ;
* `any` ou `all`, notamment avec l'argument `axis` ;
* `np.array_equal` pour vérifier, élément par élément, l'égalité.


Soient `x` un *array* multidimensionnel et `y` un *array* unidimensionnel présentant une valeur manquante. 
:::

::: {.content-visible when-profile="en"}
Whenever possible, it is recommended to use `numpy`'s logical functions (optimized and well-handling dimensions). Among them are:

* `count_nonzero` ;
* `isnan` ;
* `any` or `all` especially with the `axis` argument ;
* `np.array_equal` to check element-by-element equality.

Let's create `x` a multidimensional array and `y` a one-dimensional array with a missing value.

:::

::: {#caf2fe75 .cell}
``` {.python .cell-code}
# Assuming rng has been created beforehand
x = rng.normal(0, size=(3, 4))
y = np.array([np.nan, 0, 1])
```
:::


::: {.content-visible when-profile="fr"}
::: {.callout-tip}
## Exercice 4

1. Utiliser `count_nonzero` sur `y`
2. Utiliser `isnan` sur `y` et compter le nombre de valeurs non NaN
3. Vérifier que `x` comporte au moins une valeur positive dans son ensemble, en parcourant les lignes puis les colonnes. 

<details>
<summary>
Aide
</summary>

Jetez un oeil au paramètre `axis` en vous documentant sur internet. Par exemple [ici](https://www.sharpsightlabs.com/blog/numpy-axes-explained/).

</details>

:::

:::

::: {.content-visible when-profile="en"}
::: {.callout-tip}
## Exercise 4

1. Use `count_nonzero` on `y`
2. Use `isnan` on `y` and count the number of non-NaN values
3. Check if `x` has at least one positive value in its entirety, by rows and then by columns.

<details>
<summary>
Hint
</summary>

Take a look at the `axis` parameter by researching online. For example, [here](https://www.sharpsightlabs.com/blog/numpy-axes-explained/).

</details>

:::

:::



::: {.content-visible when-profile="fr"}

# Manipuler un _array_

## Fonctions de manipulation

`Numpy` propose des méthodes ou des fonctions standardisées pour
modifier un array, voici un tableau en présentant quelques-unes:

| Opération | Implémentation |
|-----------|----------------|
| Aplatir un array | `x.flatten()` (méthode) |
| Transposer un array | `x.T` (méthode) ou `np.transpose(x)` (fonction) |
| Ajouter des éléments à la fin | `np.append(x, [1,2])` |
| Ajouter des éléments à un endroit donné (aux positions 1 et 2) | `np.insert(x, [1,2], 3)` |
| Supprimer des éléments (aux positions 0 et 3) | `np.delete(x, [0,3])` |

Pour combiner des array, on peut utiliser, selon les cas, 
les fonctions `np.concatenate`, `np.vstack` ou la méthode `.r_` (concaténation *rowwise*). 
`np.hstack` ou la méthode `.column_stack` ou `.c_` (concaténation *column-wise*)

:::

::: {.content-visible when-profile="en"}
# Manipulating an array


## Manipulation functions

`Numpy` provides standardized methods or functions for modifying
here's a table showing some of them:


Here are some functions to modify an array:

| Operation | Implementation |
|-----------|----------------|
| Flatten an array | `x.flatten()` (method) |
| Transpose an array | `x.T` (method) or `np.transpose(x)` (function) |
| Append elements to the end | `np.append(x, [1,2])` |
| Insert elements at a given position (at positions 1 and 2) | `np.insert(x, [1,2], 3)` |
| Delete elements (at positions 0 and 3) | `np.delete(x, [0,3])` |

To combine arrays, you can use, depending on the case, the functions `np.concatenate`, `np.vstack` or the method `.r_` (row-wise concatenation). `np.hstack` or the method `.column_stack` or `.c_` (column-wise concatenation).

:::

::: {#90360a08 .cell}
``` {.python .cell-code}
x = rng.normal(size = 10)
```
:::


::: {.content-visible when-profile="fr"}
Pour ordonner un array, on utilise `np.sort`
:::
::: {.content-visible when-profile="en"}
To sort an array, use `np.sort`
:::

::: {#ebab84f8 .cell}
``` {.python .cell-code}
x = np.array([7, 2, 3, 1, 6, 5, 4])

np.sort(x)
```
:::


::: {.content-visible when-profile="fr"}
Si on désire faire un ré-ordonnement partiel pour trouver les _k_ valeurs les plus petites d'un `array` sans les ordonner, on utilise `partition`:
:::
::: {.content-visible when-profile="en"}
If you want to perform a partial reordering to find the _k_ smallest values in an `array` without sorting them, use `partition`:
:::

::: {#b0e6344a .cell}
``` {.python .cell-code}
np.partition(x, 3)
```
:::


::: {.content-visible when-profile="fr"}

## Statistiques sur un _array_

Pour les statistiques descriptives classiques,
`Numpy` propose un certain nombre de fonctions déjà implémentées,
qui peuvent être combinées avec l'argument `axis`

:::

::: {.content-visible when-profile="en"}
For classical descriptive statistics, `Numpy` offers a number of already implemented functions, which can be combined with the `axis` argument.
:::

::: {#ebb068af .cell}
``` {.python .cell-code}
x = rng.normal(0, size=(3, 4))
```
:::


::: {.content-visible when-profile="fr"}
::: {.callout-tip}
## Exercice 5


1. Faire la somme de tous les éléments d'un `array`, des éléments en ligne et des éléments en colonne. Vérifier
la cohérence.
2. Ecrire une fonction `statdesc` pour renvoyer les valeurs suivantes : moyenne, médiane, écart-type, minimum et maximum.
L'appliquer sur `x` en jouant avec l'argument _axis_

:::





:::
::: {.content-visible when-profile="en"}
::: {.callout-tip}
## Exercise 5

1. Sum all the elements of an `array`, the elements by row, and the elements by column. Verify the consistency.
2. Write a function `statdesc` to return the following values: mean, median, standard deviation, minimum, and maximum. Apply it to `x` using the _axis_ argument.

:::





:::


::: {.content-visible when-profile="fr"}

# _Broadcasting_

Le *broadcasting* désigne un ensemble de règles permettant
d'appliquer des opérations sur des tableaux de dimensions différentes. En pratique, 
cela consiste généralement à appliquer une seule opération à l'ensemble des membres d'un tableau `numpy`. 

La différence peut être comprise à partir de l'exemple suivant. Le *broadcasting* permet
de transformer le scalaire `5` en *array* de dimension 3:

::: {#e5dd446b .cell}
``` {.python .cell-code}
a = np.array([0, 1, 2])
b = np.array([5, 5, 5])

a + b
a + 5
```
:::


Le *broadcasting* peut être très pratique pour effectuer de manière efficace des opérations sur des données à
la structure complexe. Pour plus de détails, se rendre
[ici](https://jakevdp.github.io/PythonDataScienceHandbook/02.05-computation-on-arrays-broadcasting.html) ou [ici](https://stackoverflow.com/questions/47435526/what-is-the-meaning-of-axis-1-in-keras-argmax).
:::

::: {.content-visible when-profile="en"}
# Broadcasting

Broadcasting refers to a set of rules for applying operations to arrays of different dimensions. In practice, it generally consists of applying a single operation to all members of a `numpy` array.

The difference can be understood from the following example. Broadcasting allows the scalar `5` to be transformed into a 3-dimensional array:

::: {#a2c2ad6b .cell}
``` {.python .cell-code}
a = np.array([0, 1, 2])
b = np.array([5, 5, 5])

a + b
a + 5
```
:::


Broadcasting can be very practical for efficiently performing operations on data with a complex structure. For more details, visit [here](https://jakevdp.github.io/PythonDataScienceHandbook/02.05-computation-on-arrays-broadcasting.html) or [here](https://stackoverflow.com/questions/47435526/what-is-the-meaning-of-axis-1-in-keras-argmax).

:::

::: {.content-visible when-profile="fr"}

## Une application: programmer ses propres k-nearest neighbors



::: {.callout-tip}
## Exercice 6 (un peu plus corsé)


1. Créer `X` un tableau à deux dimensions (i.e. une matrice) comportant 10 lignes
et 2 colonnes. Les nombres dans le tableau sont aléatoires.
2. Importer le module `matplotlib.pyplot` sous le nom `plt`. Utiliser
`plt.scatter` pour représenter les données sous forme de nuage de points. 
3. Constuire une matrice 10x10 stockant, à l'élément $(i,j)$, la distance euclidienne entre les points $X[i,]$ et $X[j,]$. Pour cela, il va falloir jouer avec les dimensions en créant des tableaux emboîtés à partir par des appels à `np.newaxis` :
   1. En premier lieu, utiliser `X1 = X[:, np.newaxis, :]` pour transformer la matrice en tableau emboîté. Vérifier les dimensions
   2. Créer `X2` de dimension `(1, 10, 2)` à partir de la même logique
   3. En déduire, pour chaque point, la distance avec les autres points pour chaque coordonnées. Elever celle-ci au carré
   4. A ce stade, vous devriez avoir un tableau de dimension `(10, 10, 2)`. La réduction à une matrice s'obtient en sommant sur le dernier axe. Regarder dans l'aide de `np.sum` comme effectuer une somme sur le dernier axe.
   5. Enfin, appliquer la racine carrée pour obtenir une distance euclidienne en bonne et due forme. 
4. Vérifier que les termes diagonaux sont bien nuls (distance d'un point à lui-même...)
5. Il s'agit maintenant de classer, pour chaque point, les points dont les valeurs sont les plus similaires. Utiliser `np.argsort` pour obtenir, pour chaque ligne, le classement des points les plus proches
6. On va s'intéresser aux k-plus proches voisins. Pour le moment, fixons k=2. Utiliser `argpartition` pour réordonner chaque ligne de manière à avoir les 2 plus proches voisins de chaque point d'abord et le reste de la ligne ensuite
7. Utiliser le morceau de code ci-dessous

:::

::: {.cell .markdown}
```{=html}
<details><summary>Un indice pour représenter graphiquement les plus proches voisins</summary>
```


~~~python
plt.scatter(X[:, 0], X[:, 1], s=100)

# draw lines from each point to its two nearest neighbors
K = 2

for i in range(X.shape[0]):
    for j in nearest_partition[i, :K+1]:
        # plot a line from X[i] to X[j]
        # use some zip magic to make it happen:
        plt.plot(*zip(X[j], X[i]), color='black')
~~~


```{=html}
</details>
```
:::



::: {.content-visible when-profile="fr"}
Pour la question 2, vous devriez obtenir un graphique ayant cet aspect
:::
::: {.content-visible when-profile="fr"}
For question 2, you should get a graph that looks like this:
:::





::: {.content-visible when-profile="fr"}
Le résultat de la question 7 est le suivant : 
:::
::: {.content-visible when-profile="en"}
Question 7 result is :
:::



Ai-je inventé cet exercice corsé ? Pas du tout, il vient de l'ouvrage [_Python Data Science Handbook_](https://jakevdp.github.io/PythonDataScienceHandbook/02.08-sorting.html#Example:-k-Nearest-Neighbors). Mais, si je vous l'avais indiqué immédiatement, auriez-vous cherché à répondre aux questions ?

Par ailleurs, il ne serait pas une bonne idée de généraliser cet algorithme à de grosses données. La complexité de notre approche est $O(N^2)$. L'algorithme implémenté par `Scikit-Learn` est
en $O[NlogN]$.

De plus, le calcul de distances matricielles en utilisant la puissance des cartes graphiques serait plus rapide. A cet égard, la librairie [faiss](https://github.com/facebookresearch/faiss) ou les _frameworks_ spécialisés dans le calcul de distance entre des vecteurs à haute dimension comme [ChromaDB](https://www.trychroma.com/) 
offrent des performances beaucoup plus satisfaisantes que celles que permettraient `Numpy` sur ce problème précis.

:::

::: {.content-visible when-profile="en"}
## Application: programming your own k-nearest neighbors



::: {.callout-tip}
## Exercise 6 (a bit more challenging)

1. Create `X`, a two-dimensional array (i.e., a matrix) with 10 rows and 2 columns. The numbers in the array are random.
2. Import the `matplotlib.pyplot` module as `plt`. Use `plt.scatter` to plot the data as a scatter plot.
3. Construct a 10x10 matrix storing, at element $(i,j)$, the Euclidean distance between points $X[i,]$ and $X[j,]$. To do this, you will need to work with dimensions by creating nested arrays using `np.newaxis`:
   1. First, use `X1 = X[:, np.newaxis, :]` to transform the matrix into a nested array. Check the dimensions.
   2. Create `X2` of dimension `(1, 10, 2)` using the same logic.
   3. Deduce, for each point, the distance with other points for each coordinate. Square this distance.
   4. At this stage, you should have an array of dimension `(10, 10, 2)`. The reduction to a matrix is obtained by summing over the last axis. Check the help of `np.sum` on how to sum over the last axis.
   5. Finally, apply the square root to obtain a proper Euclidean distance.
4. Verify that the diagonal elements are zero (distance of a point to itself...).
5. Now, sort for each point the points with the most similar values. Use `np.argsort` to get the ranking of the closest points for each row.
6. We are interested in the k-nearest neighbors. For now, set k=2. Use `argpartition` to reorder each row so that the 2 closest neighbors of each point come first, followed by the rest of the row.
7. Use the code snippet below to graphically represent the nearest neighbors.

:::


::: {.cell .markdown}
```{=html}
<details><summary>A hint for graphically representing the nearest neighbors</summary>
```

~~~python
plt.scatter(X[:, 0], X[:, 1], s=100)

# draw lines from each point to its two nearest neighbors
K = 2

for i in range(X.shape[0]):
    for j in nearest_partition[i, :K+1]:
        # plot a line from X[i] to X[j]
        # use some zip magic to make it happen:
        plt.plot(*zip(X[j], X[i]), color='black')
~~~


```{=html}
</details>
```
:::



::: {.content-visible when-profile="fr"}
Pour la question 2, vous devriez obtenir un graphique ayant cet aspect
:::
::: {.content-visible when-profile="fr"}
For question 2, you should get a graph that looks like this:
:::





::: {.content-visible when-profile="fr"}
Le résultat de la question 7 est le suivant : 
:::
::: {.content-visible when-profile="en"}
Question 7 result is :
:::



Did I invent this challenging exercise? Not at all, it comes from the book [_Python Data Science Handbook_](https://jakevdp.github.io/PythonDataScienceHandbook/02.08-sorting.html#Example:-k-Nearest-Neighbors). But if I had told you this immediately, would you have tried to answer the questions?

Moreover, it would not be a good idea to generalize this algorithm to large datasets. The complexity of our approach is $O(N^2)$. The algorithm implemented by `Scikit-Learn` is $O[NlogN]$.

Additionally, computing matrix distances using the power of GPU (graphics cards) would be faster. In this regard, the library [faiss](https://github.com/facebookresearch/faiss), or the dedicated frameworks for computing distance between high-dimensional vectors like [ChromaDB](https://www.trychroma.com/) offer much more satisfactory performance than `Numpy` for this specific problem.

:::

::: {.content-visible when-profile="fr"}

# Exercices supplémentaires

::: {.callout-tip}
## Comprendre le principe de l'algorithme <code>PageRank</code>

`Google` est devenu célèbre grâce à son algorithme `PageRank`. Celui-ci permet, à partir
de liens entre sites _web_, de donner un score d'importance à un site _web_ qui va
être utilisé pour évaluer sa centralité dans un réseau.  L'objectif de cet exercice est d'utiliser `Numpy` pour mettre en oeuvre un tel algorithme à partir d'une matrice d'adjacence qui relie les sites entre eux. 

1. Créer la matrice suivante avec `Numpy`. L'appeler `M`:

$$
\begin{bmatrix}
0 & 0 & 0 & 0 & 1 \\
0.5 & 0 & 0 & 0 & 0 \\
0.5 & 0 & 0 & 0 & 0 \\
0 & 1 & 0.5 & 0 & 0 \\
0 & 0 & 0.5 & 1 & 0
\end{bmatrix}
$$

2. Pour représenter visuellement ce _web_ minimaliste,
convertir en objet `networkx` (une librairie spécialisée
dans l'analyse de réseau) et utiliser la fonction `draw`
de ce package. 

Il s'agit de la transposée de la matrice d'adjacence
qui permet de relier les sites entre eux. Par exemple, 
le site 1 (première colonne) est référencé par
les sites 2 et 3. Celui-ci ne référence que le site 5. 

3. A partir de la page wikipedia anglaise de `PageRank`, tester
sur votre matrice. 

:::







Le site 1 est assez central car il est référencé 2 fois. Le site
5 est lui également central puisqu'il est référencé par le site 1.



:::

::: {.content-visible when-profile="en"}
# Additional Exercises


`Google` became famous thanks to its `PageRank` algorithm. This algorithm allows, from links between websites, to give an importance score to a website which will be used to evaluate its centrality in a network. The objective of this exercise is to use `Numpy` to implement such an algorithm from an adjacency matrix that links the sites together.

::: {.callout-tip}
## Comprendre le principe de l'algorithme <code>PageRank</code>

`Google` est devenu célèbre grâce à son algorithme `PageRank`. Celui-ci permet, à partir
de liens entre sites _web_, de donner un score d'importance à un site _web_ qui va
être utilisé pour évaluer sa centralité dans un réseau.  L'objectif de cet exercice est d'utiliser `Numpy` pour mettre en oeuvre un tel algorithme à partir d'une matrice d'adjacence qui relie les sites entre eux. 

1. Créer la matrice suivante avec `Numpy`. L'appeler `M`:

$$
\begin{bmatrix}
0 & 0 & 0 & 0 & 1 \\
0.5 & 0 & 0 & 0 & 0 \\
0.5 & 0 & 0 & 0 & 0 \\
0 & 1 & 0.5 & 0 & 0 \\
0 & 0 & 0.5 & 1 & 0
\end{bmatrix}
$$

2. Pour représenter visuellement ce _web_ minimaliste,
convertir en objet `networkx` (une librairie spécialisée
dans l'analyse de réseau) et utiliser la fonction `draw`
de ce package. 

Il s'agit de la transposée de la matrice d'adjacence
qui permet de relier les sites entre eux. Par exemple, 
le site 1 (première colonne) est référencé par
les sites 2 et 3. Celui-ci ne référence que le site 5. 

3. A partir de la page wikipedia anglaise de `PageRank`, tester
sur votre matrice. 

:::







Site 1 is quite central because it is referenced twice. Site 5 is also central since it is referenced by site 1.



:::

