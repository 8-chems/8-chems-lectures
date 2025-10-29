---
title: "Maîtriser les expressions régulières"
title-en: "Mastering regular expressions"
author: Lino Galiana
tags:
  - regex
  - pandas
  - re
  - Manipulation
  - Tutoriel
categories:
  - Tutoriel
  - Manipulation
description: |
  Les expressions régulières fournissent un cadre très pratique pour manipuler de manière flexible des données textuelles. Elles sont très utiles notamment pour les tâches de traitement naturel du langage (__NLP__)
  ou le nettoyage de données textuelles.
description-en: |
  Regular expressions provide a very practical framework for flexibly manipulating textual data. They are especially useful for natural language processing (__NLP__) tasks or cleaning textual data.
image: https://minio.lab.sspcloud.fr/lgaliana/generative-art/pythonds/python-regex.jfif
echo: false
---

{{< badges
    printMessage="true"
>}}


:::: {.content-visible when-format="ipynb"}
::: {.warninglang .callout-warning}
:::
::::


:::: {.content-visible when-profile="fr"}

::: {.callout-tip collapse="true"}

## Compétences à l'issue de ce chapitre

- Comprendre l’utilité des expressions régulières (regex) pour manipuler des données textuelles de manière flexible, notamment au-delà des limitations de méthodes simples comme `str.find` ;
- Maîtriser les concepts fondamentaux des regex : classes de caractères (ex. `[a-z]`), quantifieurs (`?`, `*`, `+`, `{}`), ainsi que l’utilisation d’ancres et de méta-caractères ;
- Utiliser les principales fonctions du module `re` de Python (`findall`, `search`, `match`, `sub`, `finditer`, etc.) pour rechercher, extraire ou remplacer des motifs dans des chaînes ;
- Apprendre à appliquer efficacement les regex à des données tabulaires en utilisant l’API vectorisée de `Pandas` (`str.contains`, `str.extract`, `str.findall`, `str.replace`, `str.count`) ;
- Mettre en pratique les compétences acquises à travers des exercices ciblés : extraction de dates dans une chaîne et extraction d’adresses email ou d’années de publication depuis un DataFrame.

:::

::::

  
::::: {.content-visible when-profile="en"}

::: {.callout-tip collapse="true"}

## Skills you will acquire in this chapter

- Understand how regular expressions (regex) offer powerful tools for working with text, especially where simple string methods like `str.find` fall short  
- Master the core concepts of regex: character classes (e.g. `[a-z]`), quantifiers (`?`, `*`, `+`, `{}`), anchors, and metacharacters  
- Use Python’s `re` module functions—such as `findall`, `search`, `match`, `sub`, and `finditer`—to search, extract, or replace text patterns  
- Apply regex effectively to tabular data using `pandas` vectorized string methods like `str.contains`, `str.extract`, `str.findall`, `str.replace`, and `str.count`  
- Practice these skills through hands-on exercises such as extracting dates from text or pulling out email addresses and publication years from a DataFrame  


:::

::::

# Introduction

::: {.content-visible when-profile="fr"}

`Python` offre énormément de fonctionalités très pratiques pour la manipulation de données
textuelles. C'est l'une des raisons de son
succès dans la communauté du traitement automatisé du langage (NLP, voir partie dédiée).

Dans les chapitres précédents, nous avons parfois été amenés à chercher des éléments textuels basiques. Cela était possible avec la méthode `str.find` du package `Pandas` qui constitue une version vectorisée de la méthode `find`
de base. Nous avons d'ailleurs
pu utiliser cette dernière directement, notamment lorsqu'on a fait du _web scraping_.

Cependant, cette fonction de recherche
trouve rapidement ses limites.
Par exemple, si on désire trouver à la fois les occurrences d'un terme au singulier
et au pluriel, il sera nécessaire d'utiliser
au moins deux fois la méthode `find`.
Pour des verbes conjugués, cela devient encore plus complexe, en particulier si ceux-ci changent de forme selon le sujet.

Pour des expressions compliquées, il est conseillé d'utiliser les __expressions régulières__,
ou _"regex"_. C'est une fonctionnalité qu'on retrouve dans beaucoup de langages. C'est une forme de grammaire qui permet de rechercher des expressions.

Une partie du contenu de cette partie
est une adaptation de la
[documentation collaborative sur `R` nommée `utilitR`](https://www.book.utilitr.org/03_fiches_thematiques/fiche_donnees_textuelles#regex) à laquelle j'ai participé. Ce chapitre reprend aussi du contenu du
livre [_R for Data Science_](https://r4ds.hadley.nz/regexps.html) qui présente un chapitre
très pédagogique sur les regex.

Nous allons utiliser le _package_ `re` pour illustrer nos exemples d'expressions
régulières. Il s'agit du package de référence, qui est utilisé, en arrière-plan,
par `Pandas` pour vectoriser les recherches textuelles.

:::

::: {.content-visible when-profile="en"}

`Python` offers a lot of very useful functionalities for handling textual data. This is one of the reasons for its success in the natural language processing (NLP) community (see the dedicated section).

In previous chapters, we sometimes needed to search for basic textual elements. This was possible with the `str.find` method from the `Pandas` package, which is a vectorized version of the basic `find` method. We could also use the basic method directly, especially when performing _web scraping_.

However, this search function quickly reaches its limits. For instance, if we want to find both the singular and plural occurrences of a term, we will need to use the `find` method at least twice. For conjugated verbs, it becomes even more complex, especially if their form changes according to the subject.

For complicated expressions, it is advisable to use __regular expressions__ or _"regex"_. This is a feature found in many programming languages. It is a form of grammar that allows for searching for patterns.

Part of the content in this section is an adaptation of the
[collaborative documentation on `R` called `utilitR`](https://www.book.utilitr.org/03_fiches_thematiques/fiche_donnees_textuelles#regex) to which I contributed. This chapter also draws from the book [_R for Data Science_](https://r4ds.hadley.nz/regexps.html) which presents a very pedagogical chapter on regex.

We will use the _package_ `re` to illustrate our examples of regular expressions. This is the reference package used by `Pandas` in the background to vectorize text searches.

:::

::: {#6dd1209c .cell}
``` {.python .cell-code}
import re
import pandas as pd
```
:::


::: {.content-visible when-profile="fr"}

:::: {.callout-tip}

**Les expressions régulières (*regex*) sont notoirement difficiles à maîtriser.** Il existe des outils qui facilitent le travail avec les expressions régulières.

- L'outil de référence pour ceci est [https://regex101.com/] qui permet de tester des `regex` en `Python`
tout en ayant une explication qui accompagne ce test

- De même pour [ce site](https://ole.michelsen.dk/tools/regex/) qui comporte une cheat sheet en bas de la page.

- Les jeux de [Regex Crossword](https://regexcrossword.com/) permettent d'apprendre les expressions régulières en s'amusant


Il peut être pratique de demander à des IA assistantes, comme `Github Copilot` ou `ChatGPT`, une
première version d'une regex en expliquant le contenu qu'on veut extraire.
Cela peut faire économiser pas mal de temps, sauf quand l'IA fait preuve d'une confiance excessive
et vous propose avec aplomb une regex totalement fausse...

::::

:::

::: {.content-visible when-profile="en"}

:::: {.callout-tip}

**Regular expressions (*regex*) are notoriously difficult to master.** There are tools that make working with regular expressions easier.

- The reference tool for this is [https://regex101.com/] which allows you to test `regex` in `Python` with an explanation accompanying the test.

- Similarly, [this site](https://ole.michelsen.dk/tools/regex/) has a cheat sheet at the bottom of the page.

- The [Regex Crossword](https://regexcrossword.com/) games allow you to learn regular expressions while having fun.

It can be useful to ask assistant AIs, such as `Github Copilot` or `ChatGPT`, for a first version of a regex by explaining the content you want to extract. This can save a lot of time, except when the AI is overconfident and offers you a completely wrong regex...

::::

:::


::: {.content-visible when-profile="fr"}

# Principe

**Les expressions régulières sont un outil permettant de décrire un ensemble de chaînes de caractères possibles selon une syntaxe précise, et donc de définir un motif (ou `pattern`).** Les expressions régulières servent par exemple lorsqu'on veut extraire une partie d'une chaîne de caractères, ou remplacer une partie d'une chaîne de caractères. Une expression régulière prend la forme d'une chaîne de caractères, qui peut contenir à la fois des éléments littéraux et des caractères spéciaux qui ont un sens logique.

Par exemple, `"ch.+n"` est une expression régulière qui décrit le motif suivant : la chaîne littérale `ch`, suivi de n'importe quelle chaîne d'au moins un caractère (`.+`), suivie de la lettre `n`. Dans la chaîne `"J'ai un chien."`, la sous-chaîne `"chien"` correspond à ce motif. De même pour `"chapeau ron"` dans `"J'ai un chapeau rond"`. En revanche, dans la chaîne `"La soupe est chaude."`, aucune sous-chaîne ne correpsond à ce motif (car aucun `n` n'apparaît après le `ch`).

Pour s'en convaincre, nous pouvons déjà regarder
les deux premiers cas:

:::

::: {.content-visible when-profile="en"}

# Principle

**Regular expressions are a tool used to describe a set of possible strings according to a precise syntax, and thus define a `pattern`.** Regular expressions are used, for example, when you want to extract a part of a string or replace a part of a string. A regular expression takes the form of a string, which can contain both literal elements and special characters with logical meaning.

For example, `"ch.+n"` is a regular expression that describes the following pattern: the literal string `ch`, followed by any string of at least one character (`.+`), followed by the letter `n`. In the string `"J'ai un chien."`, the substring `"chien"` matches this pattern. The same goes for `"chapeau ron"` in `"J'ai un chapeau rond"`. In contrast, in the string `"La soupe est chaude."`, no substring matches this pattern (because no `n` appears after the `ch`).

To convince ourselves, we can look at the first two cases:

:::

::: {#2239fef2 .cell}
``` {.python .cell-code}
pattern = "ch.+n"
print(re.search(pattern, "La soupe est chaude."))
```
:::


::: {.content-visible when-profile="fr"}

La regex précédente comportait deux types de caractères:

- les _caractères littéraux_ : lettres et nombres qui sont reconnus de manière littérale
- les _méta-caractères_ : symboles qui ont un sens particulier dans les regex.

Les principaux _méta-caractères_ sont `.`, `+`, `*`, `[`, `]`, `^` et `$` mais il
en existe beaucoup d'autres.
Parmi cet ensemble, on utilise principalement les quantifieurs (`.`, `+`, `*`...),
les classes de caractères (ensemble qui sont délimités par `[` et `]`)
ou les ancres (`^`, `$`...)

Dans l'exemple précédent,
nous retrouvions deux quantifieurs accolés `.+`. Le premier (`.`) signifie n'importe quel caractère[^1]. Le deuxième (`+`) signifie _"répète le pattern précédent"_.
Dans notre cas, la combinaison `.+` permet ainsi de répéter n'importe quel caractère avant de trouver un _n_.
Le nombre de fois est indeterminé : cela peut ne pas être pas nécessaire d'intercaler des caractères avant le _n_
ou cela peut être nécessaire d'en intercepter plusieurs :

[^1]: N'importe quel caractère à part le retour à la ligne (`\n`). Ceci est à garder en tête, j'ai déjà perdu des heures à chercher pourquoi mon `.` ne capturait pas ce que je voulais qui s'étalait sur plusieurs lignes...

:::

::: {.content-visible when-profile="en"}

In the previous example, we had two adjacent quantifiers `.+`. The first (`.`) means any character[^1en]. The second (`+`) means _"repeat the previous pattern"_. In our case, the combination `.+` allows us to repeat any character before finding an _n_. The number of times is indeterminate: it may not be necessary to intersperse characters before the _n_ or it may be necessary to capture several:

[^1en]: Any character except for the newline (`\n`). Keep this in mind; I have already spent hours trying to understand why my `.` did not capture what I wanted spanning multiple lines...

:::

::: {#05703c2f .cell}
``` {.python .cell-code}
print(re.search(pattern, "J'ai un chino"))
print(re.search(pattern, "J'ai un chiot très mignon."))
```
:::


::: {.content-visible when-profile="fr"}

## Classes de caractères

Lors d’une recherche, on s’intéresse aux caractères et souvent aux classes de caractères : on cherche un chiffre, une lettre, un caractère dans un ensemble précis ou un caractère qui n’appartient pas à un ensemble précis. Certains ensembles sont prédéfinis, d’autres doivent être définis à l’aide de crochets.

Pour définir un ensemble de caractères, il faut écrire cet ensemble entre crochets. Par exemple, `[0123456789]` désigne un chiffre. Comme c’est une séquence de caractères consécutifs, on peut résumer cette écriture en `[0-9]`.

Par
exemple, si on désire trouver tous les _pattern_ qui commencent par un `c` suivi
d'un `h` puis d'une voyelle (a, e, i, o, u), on peut essayer
cette expression régulière.

:::

::: {.content-visible when-profile="en"}

## Character classes

When searching, we are interested in characters and often in character classes: we look for a digit, a letter, a character in a specific set, or a character that does not belong to a specific set. Some sets are predefined, others must be defined using brackets.

To define a character set, you need to write this set within brackets. For example, `[0123456789]` denotes a digit. Since it is a sequence of consecutive characters, we can summarize this notation as `[0-9]`.

For example, if we want to find all patterns that start with a `c` followed by an `h` and then a vowel (a, e, i, o, u), we can try this regular expression:

:::

::: {#8cba3b20 .cell}
``` {.python .cell-code}
re.findall("[c][h][aeiou]", "chat, chien, veau, vache, chèvre")
```
:::


::: {.content-visible when-profile="fr"}

Il serait plus pratique d'utiliser `Pandas` dans ce cas pour isoler les
lignes qui répondent à la condition logique (en ajoutant les accents
qui ne sont pas compris sinon):

:::

::: {.content-visible when-profile="en"}

It would be more practical to use `Pandas` in this case to isolate the lines that meet the logical condition (by adding the accents that are otherwise not included):

:::

::: {#5ddb3083 .cell}
``` {.python .cell-code}
import pandas as pd
txt = pd.Series("chat, chien, veau, vache, chèvre".split(", "))
txt.str.match("ch[aeéèiou]")
```
:::


::: {.content-visible when-profile="fr"}

Cependant, l'usage ci-dessus des classes de caractères
n'est pas le plus fréquent.
On privilégie celles-ci pour identifier des
pattern complexe plutôt qu'une suite de caractères littéraux.
Les tableaux d'aide mémoire illustrent une partie des
classes de caractères les plus fréquentes
(`[:digit:]` ou `\d`...)

:::

::: {.content-visible when-profile="en"}

However, the usage of character classes as shown above is not the most common. They are preferred for identifying complex patterns rather than a sequence of literal characters. Memory aid tables illustrate some of the most common character classes (`[:digit:]` or `\d`...)

:::

::: {.content-visible when-profile="fr"}

## Quantifieurs

Nous avons rencontré les quantifieurs avec notre première expression
régulière. Ceux-ci contrôlent le nombre de fois
qu'un _pattern_ est rencontré.

Les plus fréquents sont:

- `?` : 0 ou 1 match ;
- `+` : 1 ou plus de matches ;
- `*` : 0 or more matches.

Par exemple, `colou?r` permettra de matcher à la fois l'écriture américaine et anglaise

:::

::: {.content-visible when-profile="en"}

## Quantifiers

We encountered quantifiers with our first regular expression. They control the number of times a pattern is matched.

The most common are:

- `?` : 0 or 1 match;
- `+` : 1 or more matches;
- `*` : 0 or more matches.

For example, `colou?r` will match both the American and British spellings:

:::

::: {#51bfafe6 .cell}
``` {.python .cell-code}
re.findall("colou?r", "Did you write color or colour?")
```
:::


::: {.content-visible when-profile="fr"}

Ces quantifiers peuvent bien sûr être associés à
d'autres types de caractères, notamment les classes de caractères.
Cela peut être extrêmement pratique.
Par exemple, `\d+` permettra de capturer un ou plusieurs chiffres, `\s?`
permettra d'ajouter en option un espace,
`[\w]{6,8}` un mot entre six et huit lettres qu’on écrira...

Il est aussi possible de définir le nombre de répétitions
avec `{}`:

- `{n}` matche exactement _n_ fois ;
- `{n,}` matche au moins _n_ fois ;
- `{n,m}` matche entre _n_ et _m_ fois.

Cependant, la répétition des termes
ne s'applique par défaut qu'au dernier
caractère précédent le quantifier.
On peut s'en convaincre avec l'exemple ci-dessus:

:::

::: {.content-visible when-profile="en"}

These quantifiers can of course be combined with other types of characters, especially character classes. This can be extremely useful. For example, `\d+` will capture one or more digits, `\s?` will optionally add a space, `[\w]{6,8}` will match a word between six and eight letters.

It is also possible to define the number of repetitions with `{}`:

- `{n}` matches exactly _n_ times;
- `{n,}` matches at least _n_ times;
- `{n,m}` matches between _n_ and _m_ times.

However, the repetition of terms by default only applies to the last character preceding the quantifier. We can confirm this with the example above:

:::

::: {#8618a0f3 .cell}
``` {.python .cell-code}
print(re.match("toc{4}","toctoctoctoc"))
```
:::


::: {.content-visible when-profile="fr"}

Pour pallier ce problème, il existe les parenthèses.
Le principe est le même qu'avec les règles numériques:
les parenthèses permettent d'introduire une hiérarchie.
Pour reprendre l'exemple précédent, on obtient
bien le résultat attendu grâce aux parenthèses:

:::

::: {.content-visible when-profile="en"}

To address this issue, parentheses are used. The principle is the same as with numeric rules: parentheses allow for introducing hierarchy. To revisit the previous example, we get the expected result thanks to the parentheses:

:::

::: {#f356c192 .cell}
``` {.python .cell-code}
print(re.match("(toc){4}","toctoctoctoc"))
print(re.match("(toc){5}","toctoctoctoc"))
print(re.match("(toc){2,4}","toctoctoctoc"))
```
:::


::: {.callout-note}

::: {.content-visible when-profile="fr"}
L’algorithme des expressions régulières essaye toujours de faire correspondre le plus grand morceau à l’expression régulière.

Par exemple, soit une chaine de caractère HTML:
:::

::: {.content-visible when-profile="en"}
The regular expression algorithm always tries to match the largest piece to the regular expression.

For example, consider an HTML string:
:::

::: {#6c10de48 .cell}
``` {.python .cell-code}
s = "<h1>Super titre HTML</h1>"
```
:::


::: {.content-visible when-profile="fr"}
L'expression régulière `re.findall("<.*>", s)` correspond, potentiellement,
à trois morceaux :

*  `<h1>`
*  `</h1>`
* `<h1>Super titre HTML</h1>`

C'est ce dernier qui sera choisi, car le plus grand. Pour
sélectionner le plus petit,
il faudra écrire les multiplicateurs comme ceci : `*?`, `+?`.
En voici quelques exemples:
:::

::: {.content-visible when-profile="en"}
The regular expression `re.findall("<.*>", s)` potentially matches three pieces:

*  `<h1>`
*  `</h1>`
* `<h1>Super titre HTML</h1>`

It is the last one that will be chosen, as it is the largest. To select the smallest, you need to write the quantifiers like this: `*?`, `+?`. Here are a few examples:

:::

::: {#9ad43fbe .cell}
``` {.python .cell-code}
s = "<h1>Super titre HTML</h1>\n<p><code>Python</code> est un langage très flexible</p>"
print(re.findall("<.*>", s))
print(re.findall("<p>.*</p>", s))
print(re.findall("<p>.*?</p>", s))
print(re.compile("<.*?>").findall(s))
```
:::


:::

::: {.content-visible when-profile="fr"}

## Aide-mémoire

Le tableau ci-dessous peut servir d'aide-mémoire
sur les regex:

|Expression régulière|Signification |
|------------------|---------------------------------|
|`"^"`             | Début de la chaîne de caractères |
|`"$"`             | Fin de la chaîne de caractères |
|`"\\."`           | Un point |
|`"."`             | N'importe quel caractère |
|`".+"`            | N'importe quelle suite de caractères non vide |
|`".*"`            | N'importe quelle suite de caractères, éventuellement vi
|`"[:alnum:]"`     | Un caractère alphanumérique |
|`"[:alpha:]"`     | Une lettre |
|`"[:digit:]"`     | Un chiffre |
|`"[:lower:]"`     | Une lettre minuscule |
|`"[:punct:]"`     | Un signe de ponctuation |
|`"[:space:]"`     | un espace |
|`"[:upper:]"`     | Une lettre majuscule |
|`"[[:alnum:]]+"`  | Une suite d'au moins un caractère alphanumérique |
|`"[[:alpha:]]+"`  | Une suite d'au moins une lettre |
|`"[[:digit:]]+"`  | Une suite d'au moins un chiffre |
|`"[[:lower:]]+"`  | Une suite d'au moins une lettre minuscule |
|`"[[:punct:]]+"`  | Une suite d'au moins un signe de ponctuation |
|`"[[:space:]]+"`  | Une suite d'au moins un espace |
|`"[[:upper:]]+"`  | Une suite d'au moins une lettre majuscule |
|`"[[:alnum:]]*"`  | Une suite de caractères alphanumériques, éventuellement vide |
|`"[[:alpha:]]*"`  | Une suite de lettres, éventuellement vide |
|`"[[:digit:]]*"`  | Une suite de chiffres, éventuellement vide |
|`"[[:lower:]]*"`  | Une suite de lettres minuscules, éventuellement vide |
|`"[[:upper:]]*"`  | Une suite de lettres majuscules, éventuellement vide |
|`"[[:punct:]]*"`  | Une suite de signes de ponctuation, éventuellement vide
|`"[^[:alpha:]]+"` | Une suite d'au moins un caractère autre qu'une lettre |
|`"[^[:digit:]]+"` | Une suite d'au moins un caractère autre qu'un chiffre |
|`"\|"`             | L'une des expressions `x` ou `y` est présente          |
|`[abyz]`         | Un seul des caractères spécifiés  |
|`[abyz]+`        | Un ou plusieurs des caractères spécifiés (éventuellement répétés) |
|`[^abyz]`        | Aucun des caractères spécifiés n'est présent  |


Certaines classes de caractères bénéficient d'une syntaxe plus légère car
elles sont très fréquentes. Parmi-celles:

|Expression régulière|Signification |
|------------------|---------------------------------|
| `\d`             | N'importe quel chiffre  |
| `\D`             | N'importe quel caractère qui n'est pas un caractère |
| `\s`             | N'importe quel espace (espace, tabulation, retour à la ligne) |
| `\S`             | N'importe quel caractère qui n'est pas un espace |
| `\w`             | N'importe quel type de mot (lettres et nombres)
| `\W`             | N'importe quel ensemble qui n'est pas un mot (lettres et nombres)


Dans l'exercice suivant, vous allez pouvoir mettre en pratique
les exemples précédents sur une `regex` un peu plus complète.
Cet exercice ne nécessite pas la connaissance des subtilités
du _package_ `re`, vous n'aurez besoin que de `re.findall`.

Cet exercice utilisera la chaine de caractère suivante :

:::

::: {.content-visible when-profile="en"}

## Cheat sheet

The table below serves as a cheat sheet for regex:

|Regular expression|Meaning |
|------------------|---------------------------------|
|`"^"`             | Start of the string |
|`"$"`             | End of the string |
|`"\\."`           | A dot |
|`"."`             | Any character |
|`".+"`            | Any non-empty sequence of characters |
|`".*"`            | Any sequence of characters, possibly empty |
|`"[:alnum:]"`     | An alphanumeric character |
|`"[:alpha:]"`     | A letter |
|`"[:digit:]"`     | A digit |
|`"[:lower:]"`     | A lowercase letter |
|`"[:punct:]"`     | A punctuation mark |
|`"[:space:]"`     | A space |
|`"[:upper:]"`     | An uppercase letter |
|`"[[:alnum:]]+"`  | A sequence of at least one alphanumeric character |
|`"[[:alpha:]]+"`  | A sequence of at least one letter |
|`"[[:digit:]]+"`  | A sequence of at least one digit |
|`"[[:lower:]]+"`  | A sequence of at least one lowercase letter |
|`"[[:punct:]]+"`  | A sequence of at least one punctuation mark |
|`"[[:space:]]+"`  | A sequence of at least one space |
|`"[[:upper:]]+"`  | A sequence of at least one uppercase letter |
|`"[[:alnum:]]*"`  | A sequence of alphanumeric characters, possibly empty |
|`"[[:alpha:]]*"`  | A sequence of letters, possibly empty |
|`"[[:digit:]]*"`  | A sequence of digits, possibly empty |
|`"[[:lower:]]*"`  | A sequence of lowercase letters, possibly empty |
|`"[[:upper:]]*"`  | A sequence of uppercase letters, possibly empty |
|`"[[:punct:]]*"`  | A sequence of punctuation marks, possibly empty |
|`"[^[:alpha:]]+"` | A sequence of at least one character that is not a letter |
|`"[^[:digit:]]+"` | A sequence of at least one character that is not a digit |
|`"\|"`             | Either the expression `x` or `y` is present |
|`[abyz]`         | One of the specified characters |
|`[abyz]+`        | One or more of the specified characters (possibly repeated) |
|`[^abyz]`        | None of the specified characters are present |

Some character classes have lighter syntax because they are very common. Among them:

|Regular expression|Meaning |
|------------------|---------------------------------|
| `\d`             | Any digit |
| `\D`             | Any character that is not a digit |
| `\s`             | Any space (space, tab, newline) |
| `\S`             | Any character that is not a space |
| `\w`             | Any word character (letters and numbers) |
| `\W`             | Any non-word character (letters and numbers) |

In the following exercise, you will be able to practice the previous examples on a slightly more complete `regex`. This exercise does not require knowledge of the nuances of the `re` package; you will only need `re.findall`.

This exercise will use the following string:

:::

::: {#4e5b78f2 .cell}
``` {.python .cell-code}
s = """date 0 : 14/9/2000
date 1 : 20/04/1971     date 2 : 14/09/1913     date 3 : 2/3/1978
date 4 : 1/7/1986     date 5 : 7/3/47     date 6 : 15/10/1914
date 7 : 08/03/1941     date 8 : 8/1/1980     date 9 : 30/6/1976"""
s
```
:::


::: {.content-visible when-profile="fr"}

::: {.callout-tip}
## Exercice 1

1. On va d'abord s'occuper d'extraire le jour de naissance. 
    + Le premier chiffre du jour est 0, 1, 2 ou 3. Traduire cela sous la forme d'une séquence `[X-X]`
    + Le deuxième chiffre du jour est lui entre 0 et 9. Traduire cela sous la séquence adéquate
    + Remarquez que le premier jour est facultatif. Intercaler entre les deux classes de caractère adéquate 
     le quantifieur qui convient
    + Ajouter le slash à la suite du motif
    + Tester avec `re.findall`. Vous devriez obtenir beaucoup plus d'échos que nécessaire.
      C'est normal, à ce stade la 
      regex n'est pas encore finalisée
2. Suivre la même logique pour les mois en notant que les mois du calendrier grégorien ne dépassent
  jamais la première dizaine. Tester avec `re.findall`
3. De même pour les années de naissance en notant que jusqu'à preuve du contraire, pour des personnes vivantes
aujourd'hui, les millénaires concernés sont restreints. Tester avec `re.findall`
4. Cette regex n'est pas naturelle, on pourrait très bien se satisfaire de classes de
caractères génériques `\d` même si elles pourraient, en pratique, nous sélectionner des
dates de naissance non possibles (`43/78/4528` par exemple). Cela permettrait
d'alléger la regex afin de la rendre plus intelligible. Ne pas oublier l'utilité des quantifieurs.
5. Comment adapter la regex pour qu'elle soit toujours valide pour nos cas mais permette aussi de
capturer les dates de type `YYYY/MM/DD` ? Tester sur `1998/07/12`


:::

:::

::: {.content-visible when-profile="en"}

::: {.callout-tip}
## Exercise 1

1. First, extract the day of birth.
    + The first digit of the day is 0, 1, 2, or 3. Translate this into a `[X-X]` sequence.
    + The second digit of the day is between 0 and 9. Translate this into the appropriate sequence.
    + Note that the first digit of the day is optional. Insert the appropriate quantifier between the two character classes.
    + Add the slash after the pattern.
    + Test with `re.findall`. You should get many more matches than needed. This is normal; at this stage, the regex is not yet finalized.
2. Follow the same logic for the months, noting that Gregorian calendar months never exceed the first dozen. Test with `re.findall`.
3. Do the same for the birth years, noting that, unless proven otherwise, for people alive today, the relevant millennia are limited. Test with `re.findall`.
4. This regex is not natural; one could be satisfied with generic character classes `\d`, even though they might practically select impossible birth dates (e.g., `43/78/4528`). This would simplify the regex, making it more readable. Don’t forget the usefulness of quantifiers.
5. How can the regex be adapted to always be valid for our cases but also capture dates of the type `YYYY/MM/DD`? Test with `1998/07/12`.

:::

:::











::: {.content-visible when-profile="fr"}

A l'issue de la question 1, vous devriez avoir ce résultat :



A l'issue de la question 2, vous devriez avoir ce résultat, qui commence à prendre forme:



A l'issue de la question 3, on parvient bien à extraire les dates :



Si tout va bien, à la question 5, votre regex devrait fonctionner:



:::

::: {.content-visible when-profile="en"}

At the end of question 1, you should have this result:



At the end of question 2, you should have this result, which is starting to take shape:



At the end of question 3, you should be able to extract the dates:



If all goes well, by question 5, your regex should work:



:::


::: {.content-visible when-profile="fr"}

# Principales fonctions de `re`

Voici un tableau récapitulatif des principales
fonctions du package `re` suivi d'exemples.

Nous avons principalement
utilisé jusqu'à présent `re.findall` qui est
l'une des fonctions les plus pratiques du _package_.
`re.sub` et `re.search` sont également bien pratiques.
Les autres sont moins vitales mais peuvent dans des
cas précis être utiles.

| Fonction         | Objectif        |
|------------------|-----------------|
| `re.match(<regex>, s)` | Trouver et renvoyer le __premier__ _match_ de l'expression régulière `<regex>` __à partir du début__ du _string_ `s` |
| `re.search(<regex>, s)` | Trouver et renvoyer le __premier__ _match_ de l'expression régulière `<regex>` __quelle que soit sa position__ dans le _string_ `s` |
| `re.finditer(<regex>, s)` | Trouver et renvoyer un itérateur stockant tous les _matches_ de l'expression régulière `<regex>` __quelle que soit leur(s) position(s)__ dans le _string_ `s`. En général, on effectue ensuite une boucle sur cet itérateur |
| `re.findall(<regex>, s)` | Trouver et renvoyer **tous les _matches_** de l'expression régulière `<regex>` __quelle que soit leur(s) position(s)__ dans le _string_ `s` sous forme de __liste__ |
| `re.sub(<regex>, new_text, s)` | Trouver et __remplacer tous__ les _matches_ de l'expression régulière `<regex>` __quelle que soit leur(s) position(s)__ dans le _string_ `s` |

Pour illustrer ces fonctions, voici quelques exemples:

:::

::: {.content-visible when-profile="en"}

# Main `re` functions

Here is a summary table of the main functions of the `re` package with examples.

We have mainly used `re.findall` so far, which is one of the most practical functions in the package. `re.sub` and `re.search` are also quite useful. The others are less critical but can be helpful in specific cases.

| Function         | Purpose        |
|------------------|-----------------|
| `re.match(<regex>, s)` | Find and return the __first__ match of the regular expression `<regex>` __from the beginning__ of the string `s` |
| `re.search(<regex>, s)` | Find and return the __first__ match of the regular expression `<regex>` __regardless of its position__ in the string `s` |
| `re.finditer(<regex>, s)` | Find and return an iterator storing all matches of the regular expression `<regex>` __regardless of their position(s)__ in the string `s`. Typically, a loop is performed over this iterator |
| `re.findall(<regex>, s)` | Find and return **all matches** of the regular expression `<regex>` __regardless of their position(s)__ in the string `s` as a __list__ |
| `re.sub(<regex>, new_text, s)` | Find and __replace all__ matches of the regular expression `<regex>` __regardless of their position(s)__ in the string `s` |

To illustrate these functions, here are some examples:
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>re.match</code> 👇</summary>
```

`re.match` ne peut servir qu'à capturer un _pattern_ en début
de _string_. Son utilité est donc limitée.
Capturons néanmoins `toto` :

::: {#fc86e3ce .cell}
``` {.python .cell-code}
re.match("(to){2}", "toto à la plage")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>re.match</code> 👇</summary>
```

`re.match` can only capture a pattern at the start of a string. Its utility is thus limited. Let’s capture `toto`:

::: {#810b4293 .cell}
``` {.python .cell-code}
re.match("(to){2}", "toto at the beach")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>re.search</code> 👇</summary>
```

`re.search` est plus puissant que `re.match`, on peut
capturer des termes quelle que soit leur position
dans un _string_. Par exemple, pour capturer _age_ :

::: {#43613d64 .cell}
``` {.python .cell-code}
re.search("age", "toto a l'age d'aller à la plage")
```
:::


Et pour capturer exclusivement _"age"_ en fin
de _string_ :

::: {#e14fff75 .cell}
``` {.python .cell-code}
re.search("age$", "toto a l'age d'aller à la plage")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>re.search</code> 👇</summary>
```

`re.search` is more powerful than `re.match`, allowing capture of terms regardless of their position in a string. For example, to capture _age_:

::: {#e8150d1a .cell}
``` {.python .cell-code}
re.search("age", "toto is of age to go to the beach")
```
:::


And to capture exclusively _"age"_ at the end of the string:

::: {#bc13167f .cell}
``` {.python .cell-code}
re.search("age$", "toto is of age to go to the beach")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>re.finditer</code> 👇</summary>
```

`re.finditer` est, à mon avis,
moins pratique que `re.findall`. Son utilité
principale par rapport à `re.findall`
est de capturer la position dans un champ textuel:

::: {#58261660 .cell}
``` {.python .cell-code}
s = "toto a l'age d'aller à la plage"
for match in re.finditer("age", s):
    start = match.start()
    end = match.end()
    print(f'String match "{s[start:end]}" at {start}:{end}')
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>re.finditer</code> 👇</summary>
```

`re.finditer` is, in my opinion, less practical than `re.findall`. Its main use compared to `re.findall` is capturing the position within a text field:

::: {#00e4edd4 .cell}
``` {.python .cell-code}
s = "toto is of age to go to the beach"
for match in re.finditer("age", s):
    start = match.start()
    end = match.end()
    print(f'String match "{s[start:end]}" at {start}:{end}')
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>re.sub</code> 👇</summary>
```

`re.sub` permet de capturer et remplacer des expressions.
Par exemple, remplaçons _"age"_ par _"âge"_. Mais attention,
il ne faut pas le faire lorsque le motif est présent dans _"plage"_.
On va donc mettre une condition négative: capturer _"age"_ seulement
s'il n'est pas en fin de _string_ (ce qui se traduit en _regex_ par `?!$`)

::: {#2967a307 .cell}
``` {.python .cell-code}
re.sub("age(?!$)", "âge", "toto a l'age d'aller à la plage")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>re.sub</code> 👇</summary>
```

`re.sub` allows capturing and replacing expressions. For example, let's replace _"age"_ with _"âge"_. But be careful, you don't want to do this when the pattern is present in _"beach"_. So, we'll add a negative condition: capture _"age"_ only if it is not at the end of the string (which translates to regex as `?!$`).

::: {#35b010e6 .cell}
``` {.python .cell-code}
re.sub("age(?!$)", "âge", "toto a l'age d'aller à la plage")
```
:::


```{=html}
</details>
```
::::
:::


::: {.content-visible when-profile="fr"}
:::: {.callout-tip}
## Quand utiliser `re.compile` et les raw strings ?

`re.compile` peut être intéressant lorsque
vous utilisez une expression régulière plusieurs fois dans votre code.
Cela permet de compiler l'expression régulière en un objet reconnu par `re`,
ce qui peut être plus efficace en termes de performance lorsque l'expression régulière
est utilisée à plusieurs reprises ou sur des données volumineuses.

Les chaînes brutes (_raw string_) sont des chaînes de caractères spéciales en `Python`,
qui commencent par `r`. Par exemple `r"toto à la plage"`.
Elles peuvent être intéressantes
pour éviter que les caractères d'échappement ne soient interprétés par `Python`
Par exemple, si vous voulez chercher une chaîne qui contient une barre oblique inverse `\` dans une chaîne, vous devez utiliser une chaîne brute pour éviter que la barre oblique inverse ne soit interprétée comme un caractère d'échappement (`\t`, `\n`, etc.).
Le testeur [https://regex101.com/](https://regex101.com/) suppose d'ailleurs que
vous utilisez des _raw string_, cela peut donc être utile de s'habituer à les utiliser.

::::
:::

::: {.content-visible when-profile="en"}
:::: {.callout-tip}
## When to use `re.compile` and raw strings?

`re.compile` can be useful when you use a regular expression multiple times in your code. It allows you to compile the regular expression into an object recognized by `re`, which can be more efficient in terms of performance when the regular expression is used repeatedly or on large data sets.

Raw strings (`raw string`) are special strings in `Python` that start with `r`. For example, `r"toto at the beach"`. They can be useful to prevent escape characters from being interpreted by `Python`. For instance, if you want to search for a string containing a backslash `\` in a string, you need to use a raw string to prevent the backslash from being interpreted as an escape character (`\t`, `\n`, etc.). The tester [https://regex101.com/](https://regex101.com/) also assumes you are using raw strings, so it can be useful to get used to them.

::::
:::

::: {.content-visible when-profile="fr"}
# Généralisation avec `Pandas`

Les méthodes de `Pandas` sont des extensions de celles de `re`
qui évitent de faire une boucle pour regarder,
ligne à ligne, une regex. En pratique, lorsqu'on traite des
`DataFrames`, on utilise plutôt l'API Pandas que `re`. Les
codes de la forme `df.apply(lambda x: re.<fonction>(<regex>,x), axis = 1)`
sont à bannir car très peu efficaces.

Les noms changent parfois légèrement par rapport à leur
équivalent `re`.

| Méthode | Description |
|------------------|---------------|
| `str.count()`    | Compter le nombre d'occurrences du _pattern_ dans chaque ligne |
| `str.replace()`  | Remplacer le _pattern_ par une autre valeur. Version vectorisée de `re.sub()` |
| `str.contains()` | Tester si le _pattern_ apparaît, ligne à ligne. Version vectorisée de `re.search()` |
| `str.extract()`  | Extraire les groupes qui répondent à un  _pattern_ et les renvoyer dans une colonne |
| `str.findall()`  | Trouver et renvoyer toutes les occurrences d'un _pattern_. Si une ligne comporte plusieurs échos, une liste est renvoyée. Version vectorisée de `re.findall()` |

A ces fonctions, s'ajoutent les méthodes `str.split()` et `str.rsplit()` qui sont bien pratiques.
:::

::: {.content-visible when-profile="en"}
# Generalization with `Pandas`

`Pandas` methods are extensions of those in `re` that avoid looping to check each line with a regex. In practice, when working with `DataFrames`, the `pandas` API is preferred over `re`. Code of the form `df.apply(lambda x: re.<function>(<regex>,x), axis = 1)` should be avoided as it is very inefficient.

The names sometimes change slightly compared to their `re` equivalents.

| Method          | Description |
|-----------------|-------------|
| `str.count()`   | Count the number of occurrences of the pattern in each line |
| `str.replace()` | Replace the pattern with another value. Vectorized version of `re.sub()` |
| `str.contains()`| Test if the pattern appears, line by line. Vectorized version of `re.search()` |
| `str.extract()` | Extract groups that match a pattern and return them in a column |
| `str.findall()` | Find and return all occurrences of a pattern. If a line contains multiple matches, a list is returned. Vectorized version of `re.findall()` |

Additionally, there are `str.split()` and `str.rsplit()` methods which are quite useful.
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>str.count</code> 👇</summary>
```

On peut compter le nombre de fois qu'un _pattern_ apparaît avec
`str.count`

::: {#e0e08b92 .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.count("to")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>str.count</code> 👇</summary>
```

You can count the number of times a pattern appears with `str.count`:

::: {#092510d9 .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.count("to")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>str.replace</code> 👇</summary>
```

Remplaçons le motif _"ti"_ en fin de phrase

::: {#bac5ad4c .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.replace("ti$", " punch")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>str.replace</code> 👇</summary>
```

Replace the pattern _"ti"_ at the end of the string:

::: {#554aac39 .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.replace("ti$", " punch")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>str.contains</code> 👇</summary>
```

Vérifions les cas où notre ligne termine par _"ti"_ :

::: {#52e94b0b .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.contains("ti$")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>str.contains</code> 👇</summary>
```

Check the cases where our line ends with _"ti"_:

::: {#c4c88662 .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.contains("ti$")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="fr"}
:::: {.cell .markdown}
```{=html}
<details><summary>Exemple de <code>str.findall</code> 👇</summary>
```

::: {#3897ade7 .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.findall("to")
```
:::


```{=html}
</details>
```
::::
:::

::: {.content-visible when-profile="en"}
:::: {.cell .markdown}
```{=html}
<details><summary>Example of <code>str.findall</code> 👇</summary>
```

::: {#515e90f8 .cell}
``` {.python .cell-code}
df = pd.DataFrame({"a": ["toto", "titi"]})
df['a'].str.findall("to")
```
:::


```{=html}
</details>
```
::::
:::



::: {.content-visible when-profile="en"}
:::: {.callout-warning}

Currently, it is not necessary to add the `regex = True` argument, but this should be the case in a future version of `pandas`. It might be worth getting into the habit of adding it.

::::
:::


::: {.content-visible when-profile="fr"}
# Pour en savoir plus

- [documentation collaborative sur `R` nommée `utilitR`](https://www.book.utilitr.org/03_fiches_thematiques/fiche_donnees_textuelles#regex)
- [_R for Data Science_](https://r4ds.hadley.nz/regexps.html)
- [_Regular Expression HOWTO_ dans la documentation officielle de `Python`](https://docs.python.org/3/howto/regex.html)
- L'outil de référence [https://regex101.com/] pour tester des expressions régulières
- [Ce site](https://ole.michelsen.dk/tools/regex/) qui comporte une cheat sheet en bas de la page.
- Les jeux de [Regex Crossword](https://regexcrossword.com/) permettent d'apprendre les expressions régulières en s'amusant
:::

::: {.content-visible when-profile="en"}
# For more information

- [Collaborative documentation on `R` named `utilitR`](https://www.book.utilitr.org/03_fiches_thematiques/fiche_donnees_textuelles#regex)
- [_R for Data Science_](https://r4ds.hadley.nz/regexps.html)
- [_Regular Expression HOWTO_ in the official `Python` documentation](https://docs.python.org/3/howto/regex.html)
- The reference tool [https://regex101.com/] for testing regular expressions
- [This site](https://ole.michelsen.dk/tools/regex/) which has a cheat sheet at the bottom of the page.
- The games on [Regex Crossword](https://regexcrossword.com/) allow you to learn regular expressions while having fun
:::


::: {.content-visible when-profile="fr"}
# Exercices supplémentaires

## Extraction d'adresses email

Il s'agit d'un usage classique des _regex_
:::

::: {.content-visible when-profile="en"}
# Additional exercises

## Extracting email addresses

This is a classic use of _regex_

:::

::: {#c3dad4a1 .cell}
``` {.python .cell-code}
text_emails = 'Hello from toto@gmail.com to titi.grominet@yahoo.com about the meeting @2PM'
```
:::


::: {.content-visible when-profile="fr"}
:::: {.callout-tip}
## Exercice 2: extraction d'adresses email

Utiliser la structure d'une adresse mail `[XXXX]@[XXXX]` pour récupérer 
ce contenu

::::
:::

::: {.content-visible when-profile="en"}
:::: {.callout-tip}
## Exercise 2: Extracting email addresses

Use the structure of an email address `[XXXX]@[XXXX]` to retrieve this content.

::::
:::





::: {.content-visible when-profile="fr"}
## Extraire des années depuis un `DataFrame` `Pandas`

L'objectif général de l'exercice est de nettoyer des colonnes d'un DataFrame en utilisant des expressions régulières.
:::

::: {.content-visible when-profile="en"}
## Extracting years from a `pandas` `DataFrame`

The general objective of the exercise is to clean columns in a DataFrame using regular expressions.
:::


::: {.content-visible when-profile="fr"}

:::: {.callout-tip}
## Exercice 3

La base en question contient des livres de la British Library et quelques informations les concernant. Le jeu de données est disponible ici : https://raw.githubusercontent.com/realpython/python-data-cleaning/master/Datasets/BL-Flickr-Images-Book.csv

La colonne "Date de Publication" n'est pas toujours une année, il y a parfois d'autres informations. Le but de l'exercice est d'avoir **une date de publication du livre propre** et de regarder la **distribution des années de publications**. 

Pour ce faire, vous pouvez :

* Soit choisir de réaliser l'exercice sans aide. Votre **lecture de l'énoncé s'arrête donc ici**. Vous devez alors faire attention à bien regarder vous-même la base de données et la transformer avec attention. 

* Soit suivre les différentes étapes qui suivent pas à pas.

<details><summary>Version guidée 👇</summary>

1. Lire les données depuis l'url `https://raw.githubusercontent.com/realpython/python-data-cleaning/master/Datasets/BL-Flickr-Images-Book.csv`. Attention au séparateur
2. Ne garder que les colonnes `['Identifier', 'Place of Publication', 'Date of Publication', 'Publisher', 'Title', 'Author']`
3. Observer la colonne _'Date of Publication'_ et remarquer le problème sur certaines lignes (par exemple la ligne 13)
4. Commencez par regarder le nombre d'informations manquantes. On ne pourra pas avoir mieux après la regex, et normalement on ne devrait pas avoir moins...
5. Déterminer la forme de la regex pour une date de publication. A priori, il y a 4 chiffres qui forment une année.
Utiliser la méthode `str.extract()` avec l'argument `expand = False` (pour ne conserver que la première date concordant avec notre _pattern_)?
6. On a 2 `NaN` qui n'étaient pas présents au début de l'exercice. Quels sont-ils et pourquoi ? 
7. Quelle est la répartition des dates de publications dans le jeu de données ? Vous pouvez par exemple afficher un histogramme grâce à la méthode `plot` avec l'argument `kind ="hist"`.

</details>


::::

:::

::: {.content-visible when-profile="en"}

:::: {.callout-tip}
## Exercise 3

The dataset in question contains books from the British Library and some related information. The dataset is available here: https://raw.githubusercontent.com/realpython/python-data-cleaning/master/Datasets/BL-Flickr-Images-Book.csv

The "Date of Publication" column is not always a year; sometimes there are other details. The goal of the exercise is to have **a clean book publication date** and to examine the **distribution of publication years**.

To do this, you can:

* Either choose to perform the exercise without help. Your **reading of the instructions ends here**. You should carefully examine the dataset and transform it yourself.

* Or follow the step-by-step instructions below.

<details><summary>Guided version 👇</summary>

1. Read the data from the URL `https://raw.githubusercontent.com/realpython/python-data-cleaning/master/Datasets/BL-Flickr-Images-Book.csv`. Be careful with the separator.
2. Keep only the columns `['Identifier', 'Place of Publication', 'Date of Publication', 'Publisher', 'Title', 'Author']`.
3. Observe the _'Date of Publication'_ column and note the issues with some rows (e.g., row 13).
4. Start by looking at the number of missing values. We cannot do better after regex, and normally we should not have fewer...
5. Determine the regex pattern for a publication date. Presumably, there are 4 digits forming a year. Use the `str.extract()` method with the `expand = False` argument (to keep only the first date matching our pattern)?
6. We have 2 `NaN` values that were not present at the start of the exercise. What are they and why?
7. What is the distribution of publication dates in the dataset? You can, for example, display a histogram using the `plot` method with the `kind = "hist"` argument.

</details>

::::

:::





::: {.content-visible when-profile="fr"}
Voici par exemple le problème qu'on demande de détecter à la question 3 :
:::
::: {.content-visible when-profile="en"}
Here is an example of the problem to detect in question 3:
:::



::: {.content-visible when-profile="fr"}
A la question 4, on obtient la réponse
:::
::: {.content-visible when-profile="en"}
Question 4 answer should be
:::





::: {.content-visible when-profile="fr"}
Grâce à notre regex (question 5), on obtient ainsi un `DataFrame` plus conforme à nos attentes
:::

::: {.content-visible when-profile="en"}
With our regex (question 5), we obtain a `DataFrame` that is more in line with our expectations:
:::



::: {.content-visible when-profile="fr"}
Quant aux nouveaux `NaN`,
il s'agit de lignes qui ne contenaient pas de chaînes de caractères qui ressemblaient à des années :
:::

::: {.content-visible when-profile="en"}
As for the new `NaN` values, they are rows that did not contain any strings resembling years:
:::



::: {.content-visible when-profile="fr"}
Enfin, on obtient l'histogramme suivant des dates de publications:
:::
::: {.content-visible when-profile="en"}
Finally, we obtain the following histogram of publication dates:
:::



