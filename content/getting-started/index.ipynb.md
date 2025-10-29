---
title: Introduction
title-en: Introduction
description: "Cette introduction présente l'objectif du cours,les partis-pris pédagogiques, le fil conducteur de cet enseignement ainsi que les modalités pratiques de celui-ci."
description-en: "This introduction presents the course objective, pedagogical approach, the main theme of this of the course, as well as the practical practical details."
image: https://ensae-reproductibilite.github.io/website/egg.jpg
bibliography: ../../reference.bib
---

:::: {.content-visible when-profile="fr"}

::: {.callout-tip collapse="true"}
## Compétences à l’issue de ce chapitre

- Comprendre pourquoi Python est devenu incontournable dans le domaine de la _data science_ et du _data engineering_, notamment grâce à sa simplicité, sa lisibilité et son écosystème communautaire riche ;
- Identifier la manière dont Python peut vous assister dans les différentes étapes d'un projet de valorisation de données : structuration, exploration, modélisation, communication de résultats... ;
- Appréhender l’importance d'une démarche reproductible, rigoureuse et scientifique dans la conduite de projets de _data science_ ou de _data engineering_ et les moyens pour cela (_notebooks Jupyter_, open data, environnements standardisés...) ;
- Comprendre l’objet et les partis-pris pédagogiques du cours ainsi que son fil conducteur.
:::

::::

:::: {.content-visible when-profile="en"}

::: {.callout-tip collapse="true"}
## Skills you will acquire in this chapter

- Understand why Python has become essential in the fields of *data science* and *data engineering*, thanks to its simplicity, readability, and strong community ecosystem  
- Recognize how Python can support you through every stage of a data-driven project—from structuring and exploring data to modeling and communicating results  
- Appreciate the value of a reproducible, rigorous, and scientific approach to *data science* and *data engineering*, and learn how to support this using tools like Jupyter notebooks, open data, and standardized environments  
- Grasp the purpose and teaching goals of the course, as well as its main themes  
:::

::::

# Introduction

:::: {.content-visible when-profile="fr"}
Ce cours rassemble l'ensemble du contenu du cours
__*Python {{< fa brands python >}} pour la data science*__ que je donne à l'[ENSAE](https://www.ensae.fr/courses/python-pour-le-data-scientist-pour-leconomiste/) depuis 2020[^dupre]. Environ 190 élèves suivent ce cours chaque année. L'année 2024 a permis l'arrivée progressive d'une version anglophone équivalente à
la version française visant à servir de cours d'introduction à la _data science_ pour les instituts statistiques européens
suite à un [appel à projets européen](https://cros.ec.europa.eu/dashboard/aiml4os).

[^dupre]: Ce cours était auparavant donné par [Xavier Dupré](http://www.xavierdupre.fr/app/ensae_teaching_cs/helpsphinx3/td_2a.html).


Ce site ([pythonds.linogaliana.fr/](https://pythonds.linogaliana.fr)) est le point d'entrée principal du cours. Il rassemble l'ensemble des contenus faits en cours dans le cadre de travaux pratiques ou proposés en complément à des fins de formation en continue. Ce cours est _open source_
et j'accueille avec plaisir les suggestions d'amélioration sur [`Github` {{< fa brands github >}}](https://github.com/linogaliana/python-datascientist) ou par le biais des commentaires en bas de chaque page.

`Python` étant un langage vivant et très dynamique, les pratiques évoluent et ce cours s'adapte en continu pour tenir compte de l'écosystème mouvant de la _data science_, en essayant néanmoins de distinguer les évolutions pérennes des pratiques des effets de mode.

Quelques éléments supplémentaires sont disponibles dans
les [slides introductives](https://slidespython.linogaliana.fr/). Des éléments plus avancés sont présents dans un autre cours consacré à la mise en production de projets _data science_
que je donne avec Romain Avouac
en dernière année de l'ENSAE ([ensae-reproductibilite.github.io/website](https://ensae-reproductibilite.github.io/website)).

{{< details-iframe
     summary="Dérouler les _slides_ ou consulter celles-ci sur [plein écran](https://slidespython.linogaliana.fr/){target="_blank"}."
     src="https://slidespython.linogaliana.fr/"
>}}

::::


:::: {.content-visible when-profile="en"}
This course brings together all the material from the
__*Python {{< fa brands python >}} for Data Science*__ class I’ve been teaching at [ENSAE](https://www.ensae.fr/courses/python-pour-le-data-scientist-pour-leconomiste/) since 2020[^dupre-en]. Each year, around 190 students take this course. In 2024, an English version—equivalent to the French original—was gradually introduced. It is designed as an introductory _data science_ course for European statistical institutes, following a [European call for projects](https://cros.ec.europa.eu/dashboard/aiml4os).

[^dupre-en]: This course was originally taught by [Xavier Dupré](http://www.xavierdupre.fr/app/ensae_teaching_cs/helpsphinx3/td_2a.html).

The site ([pythonds.linogaliana.fr](https://pythonds.linogaliana.fr)) serves as the main hub for the course. It gathers all course content, including practical assignments and additional materials aimed at continuing education. The course is _open source_, and I welcome suggestions for improvement either on [`GitHub` {{< fa brands github >}}](https://github.com/linogaliana/python-datascientist) or in the comments section at the bottom of each page.

Because `Python` is a living, fast-evolving language, the course is continuously updated to reflect the changing _data science_ ecosystem. At the same time, it strives to differentiate lasting trends from short-lived fads.

You can find more information in the [introductory slides](https://slidespython.linogaliana.fr/). More advanced topics are covered in another course focused on deploying _data science_ projects to production, which I co-teach with Romain Avouac in the final year at ENSAE ([ensae-reproductibilite.github.io/website](https://ensae-reproductibilite.github.io/website)).
::::


::: {.content-visible when-profile="fr"}
:::: {.callout-note collapse="true"}
## Architecture du site web

Ce cours présente des tutoriels et des exercices complets qui peuvent être lus depuis ce site ou édités et testés dans un environnement interactif de type `Jupyter Notebook` (voir [prochain chapitre](/content/getting-started/01_environment.qmd) pour plus de détails).

Chaque page est structurée sous la forme d'un problème concret et présente la démarche générique pour résoudre ce problème général. Tous les exemples s'appuient sur de l'_open data_ et sont reproductibles.

Vous pouvez naviguer dans l'architecture du site via la table des matières ou par les liens vers le contenu antérieur ou postérieur à la fin de chaque page. Certaines parties, notamment celle consacrée à la modélisation, proposent des exemples fil-rouge pour illustrer la démarche, et les différentes approches possibles d'un même problème, de manière
plus extensive.
::::
:::

:::: {.content-visible when-profile="en"}
::::: {.callout-note collapse="true"}
## Website Architecture

This course offers comprehensive tutorials and exercises that can be read directly on the site or edited and run in an interactive `Jupyter Notebook` environment (see the [next chapter](/content/getting-started/01_environment.qmd) for details).

Each page is built around a concrete problem and introduces a general approach to solving it. All examples are based on _open data_ and are fully reproducible.

You can navigate the site using the table of contents or the previous/next links at the bottom of each page. Some sections - such as the one on modeling - include highlighted examples that illustrate the methodology and present different possible approaches to solving the same problem.


::::
:::


::: {.content-visible when-profile="fr"}
# Pourquoi faire du `Python` {{< fa brands python >}} ?

`Python`, dont le logo assez reconnaissable prend la forme de {{< fa brands python >}},
est un langage qui a déjà plus de trente ans
mais qui a connu, au cours de la décennie 2010, une
nouvelle jeunesse  du fait de l'engouement autour de
la _data science_.

`Python`, plus que tout autre
langage informatique, réunit des communautés aussi
diverses que des statisticiens, des développeurs,
des gestionnaires
d'applications ou d'infrastructures informatiques,
des lycéens - `Python` est au programme du bac français
depuis quelques années - ou des chercheurs
dans des champs à la fois théoriques et appliqués.

Contrairement à beaucoup de langages informatiques qui fédèrent
une communauté assez homogène, `Python` est parvenu à réunir
largement grâce à quelques principes centraux : la lisibilité
du langage, la simplicité à utiliser des modules,
la simplicité à l'associer à des langages plus performants
pour certaines tâches données, l'énorme volume de documentation
disponible en ligne...
Être le deuxième meilleur langage pour réaliser telle ou telle
tâche
peut ainsi être une source de succès lorsque la concurrence ne dispose
pas d'un éventail aussi large d'avantages.

Le succès de `Python`, de par sa nature de
langage couteau-suisse, est indissociable
de l'émergence du profil du _data scientist_, profil
capable de s'intégrer à différents niveaux dans la valorisation
de données.
@davenport2012data, dans la _Harvard Business Review_,
ont ainsi pu parler du _"boulot le plus sexy du 21e siècle"_
et ont pu, dix ans plus tard, faire un panorama complet de l'évolution
des compétences attendues d'un _data scientist_ dans
la même revue [@davenport2022data]. Ce ne sont d'ailleurs pas que les
_data scientists_ qui ont vocation à pratiquer `Python` ; dans le halo
des emplois autour de la donnée (_data scientist_, _data engineer_, _ML engineer_...),
`Python` fait office de tour de Babel permettant la communication entre ces
différents profils interdépendants.

La richesse de `Python` permet de l'utiliser dans toutes les phases du traitement de la donnée, de sa récupération et structuration à partir de
sources diverses à sa valorisation.
Par le prisme de la _data science_, nous verrons que `Python` est un très bon candidat pour assister les _data scientists_ dans tous les aspects du travail quotidien leur permettant de tirer de la valeur de gisements hétérogènes de données. Ce cours a néanmoins l'ambition, peut-être illusoire, d'être plus qu'un énième cours d'introduction au langage `Python`: il s'agit plutôt d'un cours d'introduction à la _data science_ s'appuyant sur `Python`. En fait, apprendre `Python` est un prétexte pour apprendre à avoir les bons réflexes quand on est confronté à un jeu de données.

Ce cours introduit différents outils qui permettent de mettre en relation grâce à `Python` des données à des concepts théoriques issus de la statistique ou des sciences économiques et sociales. Néanmoins, ce cours va au-delà d'une simple introduction au langage et revient régulièrement sur les apports, mais aussi les limites, du langage pour répondre à des besoins opérationnels ou scientifiques.
:::

::: {.content-visible when-profile="en"}
# Why `Python` ?

`Python` whose recognizable logo appears as {{< fa brands python >}}, is a language that’s been around for over thirty years. But it was in the 2010s that it experienced a major resurgence, driven by the growing popularity of _data science_.

More than any other language, `Python` brings together a wide range of communities: statisticians, application developers, IT infrastructure managers, high school students (it has been part of the French baccalaureate curriculum for several years), and researchers in both theoretical and applied fields.

Unlike many programming languages that cater to relatively homogeneous communities, `Python` has succeeded in uniting diverse users thanks to a few key principles: its readable syntax, the simplicity of using modules, the ease of integration with more powerful languages for specific tasks, and the vast amount of online documentation. Sometimes, being the second-best tool for a task—while offering a broader set of advantages—can be the key to success.

`Python` success story is closely tied to the rise of the _data scientist_ role, a profile capable of working across the entire data processing pipeline. In the _Harvard Business Review_, @davenport2012data famously called it "the sexiest job of the 21st century." A decade later, he and his co-authors provided a full update on the evolving expectations for _data scientists_ [@davenport2022data].

But it’s not only _data scientists_ who need to use `Python`. In the broader ecosystem of data-related professions—_data scientists_, _data engineers_, _ML engineers_, and more—`Python` serves as a kind of Tower of Babel, enabling collaboration among interdependent roles.

This course introduces various tools that use `Python` to connect data with theoretical concepts from statistics and the economic and social sciences. However, it goes beyond a simple introduction to the language: it regularly reflects on both the strengths and the limitations of `Python` in meeting operational and scientific needs.
:::


::: {.content-visible when-profile="fr"}

# Pourquoi faire du `Python` {{< fa brands python >}} pour l'analyse de données ?

Cette question est un peu différente car si `Python` est un langage commun pour découvrir la programmation informatique du fait de sa simplicité d'usage, comment se fait-il qu'il se soit imposé comme le langage dominant dans l'écosystème de la _data_ et de l'IA ?

`Python` est d'abord connu, dans le monde de la _data science_, pour avoir fourni très tôt les outils utiles à l'entraînement d'algorithmes de _machine learning_, avant même que cette approche devienne incontournable. Certes,
le succès de [`Scikit Learn`](https://scikit-learn.org/stable/), de [`Tensorflow`](https://www.tensorflow.org/) ou plus récemment de [`PyTorch`](https://pytorch.org/) dans la communauté de la *data science* ont beaucoup contribué à l'adoption de `Python`[^scikit-and-co]. Cependant,
réduire `Python` à quelques librairies de _machine learning_
serait réducteur tant il s'agit
d'un véritable couteau-suisse pour les *data scientists*,
les *social scientists*, les économistes ou plus généralement pour les praticiens de la donnée quelque soit leur champ d'application. La _success story_ de `Python`
n'est pas seulement le fait d'avoir proposé des librairies de _machine learning_ à un moment adéquat: ce
langage dispose de réels atouts pour de nouveaux praticiens de la donnée.

[^scikit-and-co]:
    [`Scikit Learn`](https://scikit-learn.org/stable/) est une librairie développée par les laboratoires de recherche publique français de l'INRIA depuis 2007. C'est un projet _open source_ depuis le début. Le projet est désormais maintenu par [`:probabl.`](https://probabl.ai/), une _startup_ dédiée à la gestion du projet _open source_ `Scikit` et tout son écosystème associé qui rassemble une partie des équipes de recherche de l'INRIA qui a a participé au développement de l'écosystème incontournable du _machine learning_.

    [`Tensorflow`](https://www.tensorflow.org/) est une librairie initialement développée par Google pour leurs besoins internes, celle-ci a été rendue publique en 2015. Bien que moins de moins en moins utilisée, notamment du fait de la popularité de `PyTorch`, cette librairie a eu une influence importante dans les années 2010 en favorisant l'usage des réseaux de neurone dans la recherche ou pour l'exploitation à des fins opérationnelles.

    [`PyTorch`](https://pytorch.org/) est une librairie développée par Meta depuis 2018 et rattachée depuis 2022 à la [_PyTorch foundation_](https://pytorch.org/foundation). Il s'agit aujourd'hui du principal _framework_ pour entraîner des réseaux de neurones.

L'intérêt de `Python` est son rôle central dans un
écosystème plus large autour d'outils puissants, flexibles et *open-source*. Il appartient, comme le langage {{< fa brands r-project >}}, à cette classe de langages pouvant servir au quotidien pour des tâches très diversifiées. Dans de nombreux domaines explorés dans ce cours, `Python` est, de loin, le langage informatique proposant l'écosystème le plus complet et le plus simple d'accès. Contrairement à d'autres langages très populaires, notamment `JavaScript` ou `Rust`, la courbe d'appentissage de `Python` est très légère et on peut rapidement être opérationnel et produire du code de qualité, si on a les bons réflexes (que ce cours, ainsi que celui de [mise en production](https://ensae-reproductibilite.github.io/), ambitionnent de donner).

En plus des projets d'IA (@nte-ia), `Python` est
incontournable dès lors qu'on désire récupérer des données par le biais d'API ou de _web scraping_[^js-webscraping], deux approches que nous explorerons dans la première partie du cours. Dans les domaines de l'analyse de données tabulaires[^nlp-cv], de la publication de contenu web ou de la production de graphiques, `Python` présente un écosystème
de plus en plus similaire à {{< fa brands r-project >}} du fait de l'investissement croissant de [`Posit`](https://posit.co/) et sa traduction en `Python` des librairies qui ont fait le succès de {{< fa brands r-project >}} dans le domaine de l'analyse de données ([ggplot](https://ggplot2.tidyverse.org/) notamment)

:::: {#nte-ia .callout-note collapse="false"}
## Pourquoi parler si peu d'IA dans un cours de `Python` {{< fa brands python >}} ?

Bien qu'une partie conséquente de ce cours évoque les problématiques de _machine learning_ et d'algorithmie, je rechigne généralement à rentrer dans la mode, particulièrement forte depuis fin 2022 et la sortie de `ChatGPT`, de tout dénommer IA.

En premier lieu car le terme est souvent mal défini, galvaudé et instrumentalisé par des acteurs qui profitent de sa charge symbolique forte, lié à notre imaginaire de la science fiction, pour vendre un produit "miracle" ou au contraire activer nos peurs.

Mais aussi car ce terme recouvre énormément de méthodes potentielles si on accepte une définition large. Les parties modélisation et NLP de ce cours, celles les plus proches du sujet IA, se concentrent sur les méthodes d'apprentissage. Si on reprend les définitions suivantes @RN2020 ou de l'[IA Act Européen](https://artificialintelligenceact.eu/fr/article/3/), on peut faire rentrer beaucoup plus que ces méthodes dans le concept d'intelligence artificielle:

> « L’étude des agents [intelligents] qui reçoivent des perceptions de l’environnement et agissent. Chacun de ces agents est mis en oeuvre par une fonction qui associe les perceptions aux actions, et nous couvrons différentes manières de de représenter ces fonctions, telles que les systèmes de production, les agents réactifs, les planificateurs logiques, les réseaux de neurones et les systèmes de gestion de l’information et les systèmes de théorie de la décision »
>
> @RN2020

> « Système basé sur une machine qui est conçu pour fonctionner avec différents niveaux d’autonomie et qui peut faire preuve d’adaptabilité après son déploiement, et qui, pour des objectifs explicites ou implicites, déduit, à partir des données qu’il reçoit, comment générer des résultats tels que des prédictions, du contenu, des recommandations ou des décisions qui peuvent influencer des environnements physiques ou virtuels »
>
> [AI Act européen](https://artificialintelligenceact.eu/fr/article/3/)

Pour en apprendre plus sur ce sujet, voici une présentation que j'ai faite sur le sujet de l'IA en 2024:

{{< details-iframe
     summary="Dérouler les _slides_ ou consulter celles-ci sur [plein écran](https://linogaliana.github.io/20241015-prez-ia-masa/#/title-slide/){target="_blank"}."
     src="https://linogaliana.github.io/20241015-prez-ia-masa/#/title-slide/"
>}}

Enfin, la question est également pédagogique. Quand on parle d'IA depuis 2023, on pense à l'IA générative. Je pense que pour comprendre le fonctionnement de cette approche, radicalement différent d'autres paradigmes, et être capable de mettre en oeuvre des projets d'IA générative porteurs de valeur, il faut avoir des notions sur les apports et les limites de l'approche scientifique du _machine learning_. Sinon, on se retrouve à construire des usines à gaz pour des besoins simples ou à être incapables d'évaluer l'apport d'une approche générative par rapport à d'autres approches. Ce cours étant introductif, j'ai donc choisi de me concentrer sur le _machine learning_ et du NLP basique, là encore à un niveau assez introductifs mais néanmoins déjà un peu creusés, et laisser aux curieux le soin de s'autoformer sur les sujets genIA.

::::


[^js-webscraping]: Dans ces deux domaines, le concurrent le plus sérieux pour `Python`
est `Javascript`. Néanmoins, la communauté autour de ce dernier langage est plus orientée
autour des problématiques de développement web que de _data science_.

[^nlp-cv]: Les données tabulaires sont des données structurées, organisées, comme leur nom l'indique, sous forme de tableau permettant de mettre en correspondance des observations avec des variables. Cette structuration se distingue d'autres types de données plus complexes: textes libres, images, sons, vidéos... Dans le domaine des données
non structurées, `Python` est le langage d'analyse hégémonique. Dans le domaine des données tabulaires, l'avantage compétitif de `Python` est moindre, notamment par rapport à {{< fa brands r-project >}}, mais ces deux langages proposent un noyau de fonctionnalités assez similaires. Nous aurons l'occasion de régulièrement faire le parallèle entre ces deux langages lors des chapitres consacrés à la librairie `Pandas`.

Néanmoins, il ne s'agit pas, par ces éléments, de rentrer dans la guéguerre stérile  {{< fa brands r-project >}} vs `Python`.
Ces deux langages ayant beaucoup plus de points de convergence que de divergence, il est très simple de transposer les bonnes
pratiques d'un langage à l'autre. Il s'agit d'un point qui est développé plus amplement dans le cours plus avancé que je donne avec Romain Avouac en dernière année d'ENSAE : [ensae-reproductibilite.github.io/website](https://ensae-reproductibilite.github.io/website).

A terme, les data scientists et chercheurs en sciences sociales ou en économie utiliseront de manière presque indifférente, et en alternance, {{< fa brands r-project >}} ou `Python`. Ce cours présentera ainsi régulièrement des analogies avec {{< fa brands r-project >}} pour aider les
personnes découvrant `Python`, mais connaissant déjà bien {{< fa brands r-project >}}, à mieux comprendre certains messages.
:::

:::: {.content-visible when-profile="en"}
# Why use `Python` {{< fa brands python >}} for data analysis?

This question is slightly different: if `Python` is already a popular language for learning programming due to its ease of use, how did it also become the dominant language in the _data_ and AI ecosystem?

Python first gained traction in the _data science_ world for offering tools to train _machine learning_ algorithms, even before such approaches became mainstream. Of course, the success of libraries like [`Scikit-Learn`](https://scikit-learn.org/stable/), [`TensorFlow`](https://www.tensorflow.org/), and more recently [`PyTorch`](https://pytorch.org/), played a major role in `Python`'s adoption by the *data science* community[^scikit-and-co-en]. However, reducing `Python` to a handful of _machine learning_ libraries would be overly simplistic. It is truly a Swiss Army knife for *data scientists*, social scientists, economists, and data practitioners of all kinds. Its success is not only due to offering the right tools at the right time, but also because the language itself offers real advantages for newcomers to data work.

[^scikit-and-co-en]:
    [`Scikit-Learn`](https://scikit-learn.org/stable/) is a library developed since 2007 by French public research labs at INRIA. Open source from the outset, it is now maintained by [`:probabl.`](https://probabl.ai/), a startup created to manage the `Scikit` ecosystem, bringing together some of the INRIA research teams behind the core of the modern _machine learning_ stack.

    [`TensorFlow`](https://www.tensorflow.org/) was developed internally at Google and made public in 2015. Although now less widely used - partly due to the rise of `PyTorch` - it played a major role in popularizing neural networks in both research and production during the 2010s.

    [`PyTorch`](https://pytorch.org/) was developed by Meta starting 2018 and has been governed by the [_PyTorch Foundation_](https://pytorch.org/foundation) since 2022. It is now the most widely used framework to train neural networks.

What makes `Python` appealing is its central role in a broader ecosystem of powerful, flexible, and open-source tools. Like {{< fa brands r-project >}}, it belongs to a category of languages suitable for everyday use across a wide variety of tasks. In many of the fields covered in this course, `Python` has by far the richest and most accessible ecosystem. Unlike other popular languages such as `JavaScript` or `Rust`, it has a very gentle learning curve, allowing users to write high-quality code quickly - provided they learn the right habits, which this course (and the companion course on [production workflows](https://ensae-reproductibilite.github.io/)) aims to instill.

Beyond AI projects[^nte-ia-en], `Python` is also indispensable for retrieving data via APIs or through _web scraping_[^js-webscraping-en], two techniques introduced early in the course. In areas like tabular data analysis[^nlp-cv-en], web publishing or data visualization, `Python` now offers an ecosystem comparable to {{< fa brands r-project >}}, thanks in part to growing investment from [`Posit`](https://posit.co/), which has ported many of {{< fa brands r-project >}}'s most successful libraries—such as [ggplot](https://ggplot2.tidyverse.org/) to `Python`.

::: {.callout-note collapse="true" #nte-ia-en}
## Why discuss AI so little in a `Python` {{< fa brands python >}} course?

While a significant portion of this course covers _machine learning_ and related algorithms, I tend to resist the current trend - especially strong since the release of `ChatGPT` in late 2022 - of labeling everything as "AI".

First, because the term is vague, overused, and often exploited for marketing purposes, capitalizing on its symbolic power drawn from science fiction to sell miracle solutions or stoke fear.

Second, because the term "AI" covers a vast range of possible methods, depending on how broadly we define it. The sections on modeling and NLP in this course, which are the closest to the AI field, focus on learning-based methods. But as definitions from @RN2020 or the [European AI Act](https://artificialintelligenceact.eu/fr/article/3/) show, artificial intelligence encompasses much more:

> The study of [intelligent] agents that perceive their environment and act upon it. Each such agent is implemented by a function that maps perceptions to actions. We study different ways to define this function, such as production systems, reactive agents, logical planners, neural networks, and decision-theoretic systems.
>
> @RN2020

> "AI system" means a machine-based system designed to operate with varying levels of autonomy and capable of adapting after deployment. It infers, based on its inputs, how to generate outputs—such as predictions, content, recommendations, or decisions—that can influence physical or virtual environments.
>
> [European AI Act](https://artificialintelligenceact.eu/fr/article/3/)

For more on this topic, see a presentation I gave in 2024 (in French):

{{< details-iframe
summary="Scroll the _slides_ or open in [full screen](https://linogaliana.github.io/20241015-prez-ia-masa/#/title-slide/)."
src="https://linogaliana.github.io/20241015-prez-ia-masa/#/title-slide/"
>}}

Finally, there’s also a pedagogical reason. Since 2023, "AI" has largely become synonymous with generative AI. But to understand how this radically different paradigm works - and to implement meaningful, value-driven generative AI projects - one must first understand the foundations and limitations of the _machine learning_ approach. Otherwise, there’s a risk of building overly complex solutions for simple problems or misjudging the value of generative models compared to more traditional methods. Since this is an introductory course, I’ve chosen to focus on _machine learning_ and introductory NLP, deep enough to be meaningful, while leaving it to the curious to explore generative AI further on their own.
::::

[^js-webscraping-en]: In the domains of API access and _web scraping_, `JavaScript` is `Python`'s most serious competitor. However, its community is more focused on web development than on _data science_.

[^nlp-cv-en]: Tabular data refers to structured data organized in tables that map observations to variables. This structure contrasts with unstructured data like free text, images, audio, or video. In unstructured data analysis, `Python` dominates. For tabular data, `Python` advantage is less clear - especially compared to {{< fa brands r-project >}} - but both languages now offer similar capabilities. We will regularly draw parallels between them in chapters on the `Pandas` library.

That said, this course does not aim to stir up the sterile debate between {{< fa brands r-project >}} and `Python`. The two languages share far more than they differ, and best practices are often transferable between them. This idea is explored more deeply in the advanced course I co-teach with Romain Avouac ([ensae-reproductibilite.github.io/website](https://ensae-reproductibilite.github.io/website)).

In practice, data scientists and researchers in social sciences or economics increasingly use {{< fa brands r-project >}} and `Python` interchangeably. This course will frequently draw analogies between the two, to help learners already familiar with {{< fa brands r-project >}} transition smoothly to `Python`.

:::


::: {.content-visible when-profile="fr"}

# Pourquoi apprendre `Python` quand il existe des IA génératrices de code ?

Les assistants de code, notamment `Copilot` et `ChatGPT`, ont changé à jamais le développement de code. Ces outils font maintenant parti des outils quotidiens des _data scientists_ et offrent beaucoup de confort car ils peuvent, à l'aide d'instructions plus ou moins claires, générer du code `Python`. Et ces IA ayant étaient entraînées à partir de l'ensemble du code présent sur internet, et parfois spécialisées à répondre à des problèmes de développement, elles aident beaucoup. L'ambition du _vibe coding_ est d'aller une étape plus loin dans ce processus en renforçant la prise d'initiative des LLM qui ne passerait plus par l'intermédiaire de l'humain pour accéder aux ressources de calcul qui permettent d'exécuter le code proposé.

_Puisque maintenant les IA génèrent du code, pourquoi continuer à apprendre à coder ?_

Car coder ce n'est pas juste produire des lignes de code, c'est se confronter à un problème, adopter une stratégie par étape pour y répondre, réfléchir à plusieurs solutions possibles et choisir la meilleure en arbitrant entre plusieurs objectifs (vitesse, simplicité, etc.), tester et corriger, etc. Le code est un outil au service d'un problème d'ingenieurie. Les IA savent très bien coder, elles savent relier un problème à des ressources sur lesquelles elles ont appris et savent bien transposer un problème rencontré dans un autre langage à `Python`.

Mais encore faut-il savoir formuler le problème, savoir juger de la qualité de la réponse du LLM, être capable de remettre en question la proposition de l'assistant pour corriger une erreur ou obtenir une réponse plus satisfaisante. Les LLM sont une recherche _google_ très raffinée: si vous n'avez pas les bons mots clés pour faire une recherche Google, votre recherche sera décevante. Il en va de même avec les LLM même si l'aspect conversationnel en langage naturel réduit la barrière à l'entrée.

La confrontation à un jeu de données relève avant tout d’une démarche d’ingénierie. Le code n’est pas une fin en soi, mais un outil au service d’un raisonnement structuré, visant à résoudre un problème concret. Comme un ingénieur qui conçoit un pont à partir d’un besoin de traversée, le data scientist part d’un objectif opérationnel — construire un algorithme de sélection, mesurer l’impact d’un lancement produit, prédire une évolution de ventes — pour le formuler de manière exploitable. Cela implique de traduire des concepts scientifiques ou business en questions analytiques, puis de décomposer le problème en étapes logiques, chacune traduite en instructions que la machine peut exécuter.

Dans ce cadre, un LLM peut jouer un rôle d’assistant, mais seulement si le problème est bien posé. Si les étapes sont floues ou mal définies, la réponse du modèle sera approximative, voire inutile. Sur une tâche standard, le résultat pourra sembler correct, mais sur une question plus spécifique, il faudra souvent affiner, reformuler, itérer… et parfois ne jamais obtenir de réponse satisfaisante. Non pas parce que le modèle est mauvais, mais parce que l’ingénierie du problème en amont fait toute la différence[^ai-enstein].

[^ai-enstein]: Il n'est pas inutile sur ce sujet de lire le _post_ de Thomas Wolf (CSO de `HuggingFace`) ["The Einstein AI model"](https://thomwolf.io/blog/scientific-ai.html). Même si le _post_ évoque principalement les innovations de rupture en mettant quelque peu de côté les innovations marginales, il est intéressant de comprendre que les LLM, en dépit des grandes annonces prophétiques faites par les gourous de la tech, restent des outils qui certes ont de bonnes performances sur des tests standardisés mais restent des assistants, pour l'heure.

Une dernière raison pour laquelle se contenter d'une IA de code sans recul critique est que ces dernières sont forcément en retard par rapport aux usages puisqu'elles ont été entraînées sur des données passées. L'écosystème `Python` est très dynamique et, même si les IA des principaux fournisseurs de services sont fréquemment réentrainées et peuvent maintenant accéder à internet pour rafraichir leurs connaissances, certaines librairies peuvent rapidement s'imposer dans leur domaine.

Par exemple, en cette année 2025, [`uv`](https://docs.astral.sh/uv/) a connu une adoption rapide, comme [`ruff`](https://docs.astral.sh/ruff/) l'année d'avant. Il faudra encore un peu de temps pour que les IA génératives proposent d'elles-mêmes ce gestionnaire d'environnement plutôt que [`poetry`](https://python-poetry.org/). L'existence d'IA génératives ne dispense donc pas, comme avant, d'avoir une veille technique active et d'être vigilant sur l'évolution des pratiques.
:::

::: {.content-visible when-profile="en"}

# Why learn `Python` when code-generating AIs exist?

Code assistants like `Copilot` and `ChatGPT` have fundamentally transformed software development. These tools are now part of the everyday toolkit of a _data scientist_, offering remarkable convenience by generating `Python` code from more or less well-specified instructions. Trained on massive amounts of publicly available code—and often fine-tuned for solving development tasks—they can be extremely helpful. The concept of _vibe coding_ even pushes this further, aiming to let large language models (LLMs) take initiative without requiring human intermediaries to access the computational resources needed to run the code they generate.

So, if AIs can now generate code, why should we still learn how to code?

Because coding is not just about writing lines of code. It’s about understanding a problem, crafting a step-by-step strategy to tackle it, considering multiple solutions and trade-offs (e.g., speed, simplicity), testing and debugging. Code is a means to an engineering end. While AIs are very good at generating code, relating problems to known patterns, and even translating solutions across languages into `Python`, that’s only part of the picture.

Working with data is first and foremost an engineering process. Code is not the goal—it’s the tool that supports structured reasoning toward solving real-world problems. Just like an engineer designs a bridge to meet a practical need, a data scientist begins with an operational goal—such as building a recommendation system, evaluating the impact of a product launch, or forecasting sales—and reformulates it into an analytical task. This means translating scientific or business ideas into a set of questions, then breaking those down into logical steps, each of which can be executed by a computer.

In this context, an LLM can act as a valuable assistant—but only when the problem is well formulated. If the task is vague or ill-defined, the model’s answers will be approximate or even useless. On standard problems, the results may appear accurate. But for more specific, non-standard tasks, it often becomes necessary to iterate, refine the prompt, reframe the problem… and sometimes still fail to get a satisfactory result. Not because the model is poor, but because good problem formulation—the essence of problem engineering—makes all the difference[^ai-enstein-en].

[^ai-enstein-en]: On this topic, see Thomas Wolf’s blog post [_The Einstein AI model_](https://thomwolf.io/blog/scientific-ai.html). Although the post focuses on disruptive innovation and pays less attention to incremental progress, it’s insightful in understanding that LLMs—despite bold predictions from tech influencers—are still just tools. They may excel at standardized tasks, but for now, they remain assistants.

For instance, in the year 2025, [`uv`](https://docs.astral.sh/uv/) saw rapid adoption, as did [`ruff`](https://docs.astral.sh/ruff/) the year before. It will still be some time before generative AIs propose this environment manager on their own, rather than [`poetry`](https://python-poetry.org/). The existence of generative AIs does not, therefore, dispense us, as before, from keeping an active technical watch and being vigilant about changes in practices.
:::


::: {.content-visible when-profile="fr"}
# Objectifs du cours

## Initier à la démarche de la _data science_

Ce cours s’adresse aux praticiens de la _data science_,
discipline entendue ici au sens large comme la __combinaison de techniques issues des mathématiques, de la statistique et de l’informatique pour produire de la connaissance utile à partir de données__.
Comme la _data science_ n’est pas uniquement une discipline scientique mais vise également à fournir un ensemble d’outils pour répondre à des objectifs opérationnels, l'apprentissage du principal outil nécessaire à l'acquisition de connaissances en _data science_, à savoir le langage `Python`, est également
l'occasion d'évoquer la démarche scientifique rigoureuse à adopter face à des données. Ce cours a pour objectif de présenter la démarche face à un jeu de données, les problèmes rencontrés, les solutions pour les surmonter et les implications que ces dernières peuvent avoir. Il ne s'agit donc pas que d'un cours sur un outil technique, désincarné de problématiques scientifiques.
:::

::: {.content-visible when-profile="en"}
# Course Objectives

## Introducing the data science approach

This course is intended for practitioners of _data science_, understood here in the broadest sense as the **combination of techniques from mathematics, statistics, and computer science to extract useful knowledge from data**.

Since _data science_ is not only an academic discipline but also a practical field aimed at achieving operational goals, learning its main tool—namely, the `Python` programming language—goes hand in hand with adopting a rigorous, scientific approach to data.

The objective of this course is to explore how to approach a dataset, identify and address common challenges, develop appropriate solutions, and reflect on their broader implications. It is therefore not merely a course about a technical tool, disconnected from scientific reasoning, but one rooted in understanding data through both technical and conceptual lenses.

:::


::: {.content-visible when-profile="fr"}
:::: {.callout-tip}
## Faut-il avoir un _background_ en mathématiques pour ce cours ?

Ce cours présuppose qu'on désire faire un usage de `Python` intense en données dans un cadre statistique rigoureux. Il ne revient que de manière secondaire sur les fondements statistiques ou algorithmiques derrière certaines des techniques évoquées, souvent l'objet d'enseignements dédiés, notamment à l'ENSAE.

Ne pas connaître ces notions n'empêche ainsi pas de comprendre
le contenu de ce site *web* car les concepts plus avancés sont généralement présentés à part, dans des encadrés dédiés. La facilité d'usage de `Python` évite de devoir programmer soi-même un modèle, ce qui rend possible l'application de modèles dont on n'est pas expert. La connaissance des modèles sera plutôt nécessaire dans l'interprétation des résultats.

Pour autant, même s'il est relativement facile d'utiliser des modèles complexes avec `Python`, il est fort utile d'avoir du recul sur ceux-ci avant de se lancer dans une démarche de modélisation. Il s'agit de l'une des raisons pour lesquelles la modélisation arrive si tardivement dans ce cours: en plus de faire appel à des concepts statistiques avancés, il est nécessaire, pour produire une modélisation pertinente, d'avoir appréhendé les faits stylisés dans nos données. Bien comprendre la structure des données et leur adéquation avec les hypothèses d'un modèle est indispensable pour construire une modélisation de qualité.

::::
:::

::: {.content-visible when-profile="en"}
:::: {.callout-tip}
## Do I need a math background for this course?

This course assumes you are interested in using data-intensive `Python` within a rigorous statistical framework. It does not delve deeply into the statistical or algorithmic foundations of the techniques presented - many of which are covered in dedicated courses, particularly at ENSAE.

That said, not being familiar with these concepts shoud not prevent from following this course. More advanced ideas are typically introduced separately, in dedicated callout boxes. Thanks to Python's ease of use, you will not need to implement complex models from scratch - making it possible to apply techniques even if you are not an expert in the underlying theory. What *is* important, however, is having enough understanding to correctly interpret the results.

Still, while `Python` makes it relatively easy to run sophisticated models, it is very helpful to have some perspective before diving into modeling. That explains why modeling appears later in the course: in addition to relying on advanced statistical concepts, effective modeling also requires a solid understanding of the data. You need to identify key patterns and assess whether your data fits the assumptions of the model. Without this foundation, it is difficult to build models that are truly meaningful or reliable.
::::

:::

::: {.content-visible when-profile="fr"}
## Reproductibilité

Ce cours donne une place centrale à la notion de reproductibilité. Cette exigence se traduit de diverses
manières dans cet enseignement, en premier lieu en permettant que tous les exemples et exercices de ce cours soient testés par le biais de _notebooks_ `Jupyter`[^nb].

L'ensemble du contenu du site *web* est reproductible dans des environnements informatiques divers. Il est bien sûr possible de copier-coller les morceaux de code présents dans ce site, grâce au bouton {{< fa solid clipboard >}} présent au dessus
des exemples de code:

::: {#c80d5907 .cell}
``` {.python .cell-code}
x = "Essayez de me copier-coller" #<1>
```
:::


1. Cliquez sur le bouton {{< fa solid clipboard >}} pour copier ce contenu et le coller ailleurs.


[^nb]: Un _notebook_ est un environnement interactif qui permet d'écrire et d'exécuter du code en direct. Il combine, dans un seul document, du texte, du code qui peut être exécuté et dont les sorties s'affichent après calculs. C'est extrêmement pratique pour l'apprentissage du langage `Python`. Pour plus de détails, consultez la [documentation officielle de Jupyter](https://jupyter.org/documentation).

Néanmoins, comme ce site présente de nombreux exemples, les allers et retours entre un environnement de test de `Python` et celui-ci pourraient être pénibles. Chaque chapitre est donc facilement récupérable sous forme de _notebook_ `Jupyter` grâce à des boutons au début de chaque page. Voici, par exemple, ces boutons pour le premier chapitre consacré à `Pandas` :
:::

::: {.content-visible when-profile="en"}

## Reproducibility

This course places strong emphasis on reproducibility. This principle is reflected in several ways. First and foremost, by ensuring that all examples and exercises can be run and tested using `Jupyter` _notebooks_[^nb-en].

All content on the website is designed to be reproducible across different computing environments. Of course, you're free to copy and paste code snippets directly from the site using the {{< fa solid clipboard >}} button available at the top of each code block.

[^nb-en]: Jupyter notebooks are interactive documents that allow you to combine code, text, and visualizations in a single file. They’re widely used in data science and education to make code both readable and executable.

::: {#40fb31d4 .cell}
``` {.python .cell-code}
x = "Try to copy-paste me" #<1>
```
:::


1. Click on the {{< fa solid clipboard >}} button to copy this content and paste it elsewhere.


However, since this site includes many examples, constantly switching between a `Python` environment and the website can become tedious. To make things easier, each chapter can be downloaded as a `Jupyter` _notebook_ using the buttons provided at the top of each page.

For example, here are the buttons for the first chapter on `Pandas`:

:::

{{< badges
    fpath="/content/manipulation/02_pandas_intro.qmd"
    printMessage="false"
>}}

:::: {.content-visible when-profile="fr"}
Les recommandations concernant les environnements à privilégier pour utiliser ces notebooks sont reportées au prochain chapitre.

L'exigence de reproductibilité se manifeste également
dans le choix des exemples pris pour ce cours. L'ensemble du contenu de ce site s'appuie sur des données ouvertes, qu'il s'agisse de données françaises (principalement issues de la plateforme centralisatrice [`data.gouv`](https://www.data.gouv.fr) ou du site _web_ de l'[Insee](https://www.insee.fr)) ou de données américaines. Les résultats sont donc reproductibles pour quelqu'un disposant d'un environnement identique[^environnement-identique].

[^environnement-identique]: Le fait d'ouvrir les chapitres sous la forme de _notebooks_ dans des environnements standardisés, ce qui sera proposé à partir du prochain chapitre, permet d'assurer que vous disposiez d'un environnement contrôlé. Les installations personnelles de `Python` ont toutes les chances d'avoir subies des bidouillages modifiant votre environnement et pouvant provoquer des erreurs inattendues et difficiles à comprendre: ce n'est donc pas un usage recommandé pour ce cours. Comme vous pourrez le découvrir dans le prochain chapitre, les environnements _cloud_ offrent un confort en ce qui concerne la standardisation des environnements.

::: {.callout-note}
Des chercheurs américains ont pu parler de crise de la reproductibilité dans le domaine du _machine learning_ [@Reproducibilitycrisis]. Les dérives de l'écosystème de
la publication scientifique et les enjeux économiques derrière les publications académiques dans le domaine du _machine learning_ ont une place privilégiée parmi les facteurs pouvant l'expliquer.

Néanmoins, l'enseignement universitaire porte également une responsabilité dans ce domaine. Les étudiants et chercheurs ne sont pas formés à ces sujets et s'ils n'adoptent pas cette exigence tôt dans leur parcours, ils n'y seront plus forcément incités ultérieurement. Pour cette raison, en plus de former à `Python` {{< fa brands python >}} et à la _data science_, ce cours introduit à l'usage du logiciel de contrôle de version `Git` {{< fa brands git-alt >}} dans une partie dédiée.

Tous les projets des élèves doivent être _open source_, ce qui est l'une des meilleures manières, pour un enseignant, de trouver une consigne pour que les élèves produisent un code de qualité.
:::

::::

::: {.content-visible when-profile="en"}

Recommendations on the best environments for using these notebooks are provided in the next chapter.

The focus on reproducibility is also reflected in the choice of examples used throughout the course. All content on this site is based on _open data_, sourced either from French platforms - primarily the centralized portal [`data.gouv`](https://www.data.gouv.fr), which aggregates public datasets from French institutions, or the official statistics agency [Insee](https://www.insee.fr), France’s national institute for statistics and economic studies - or from U.S. datasets. This ensures that results are reproducible for anyone working in an identical environment[^identical-environment-en].

[^identical-environment-en]: Opening the chapters as _notebooks_ in standardized environments - something explained in the next chapter - ensures you are working in a controlled setup. Personal `Python` installations often involve tweaks and adjustments that can alter your environment and lead to unexpected, hard-to-diagnose errors. For this reason, such local setups are not recommended for this course. As you’ll see in the next chapter, _cloud-based_ environments offer the advantage of consistent, preconfigured setups that greatly improve reliability and ease of use.


:::: {.callout-note}
American researchers have described a reproducibility crisis in the field of _machine learning_ [@Reproducibilitycrisis-en]. The distortions of the scientific publishing ecosystem - combined with the economic incentives driving academic publications in _machine learning_ - are often cited as major contributing factors.

However, university education also bears a share of the responsibility. Students and researchers are rarely trained in the principles of reproducibility, and if these practices are not introduced early in their careers, they are unlikely to adopt them later. This is why, in addition to teaching `Python` {{< fa brands python >}} and _data science_, this course includes a dedicated section on using version control with `Git` {{< fa brands git-alt >}}.

All student projects are required to be _open source_—one of the most effective ways for instructors to encourage high-quality, transparent, and reproducible code.
::::

:::


::: {.content-visible when-profile="fr"}
## Évaluation

Les élèves de l'ENSAE valident le cours grâce à
un projet approfondi. Les éléments relatifs à l'évaluation du cours, ainsi qu'une liste des projets déjà effectués, sont disponibles dans la section [Évaluation](/content/annexes/evaluation).
:::

::: {.content-visible when-profile="en"}
## Assessment

Students at ENSAE complete the course by working on an in-depth project. Details on how the course is assessed, along with a list of past student projects, can be found in the [Evaluation](/content/annexes/evaluation) section.

:::


::: {.content-visible when-profile="fr"}
# Plan du cours

Ce cours est une introduction aux enjeux de la _data science_ à
travers l'apprentissage du langage `Python`. Comme le terme _"data science"_
l'indique, une partie importante de ce cours est consacrée au travail sur les
données: récupération, structuration, exploration, mise en relation.

C'est l'objet de la première partie du cours ["Manipuler des données"](/content/manipulation/index.qmd) qui sert de fondement au reste du cours. Malheureusement, de nombreuses formations en _data science_, statistiques appliquées ou sciences économiques et sociales, font l'impasse sur cette part du travail des _data scientists_ - qu'on appelle parfois ["data wrangling"](https://en.wikipedia.org/wiki/Data_wrangling) ou [_"feature engineering"_](https://en.wikipedia.org/wiki/Feature_engineering) - qui, en plus de représenter une part importante du temps de travail des _data scientists_, est indispensable pour construire un modèle pertinent.

L'objectif de cette partie est d'illustrer les enjeux liés à la récupération de plusieurs types de sources de données et à leur exploitation par le biais de `Python`. Les exemples seront diversifiés, pour illustrer la richesse des données qui peuvent être analysées avec `Python`: statistiques d'émissions communales de $CO_2$ en France, données de transactions immobilières, diagnostics énergétiques des logements, données de fréquentation des stations vélib...

La deuxième partie est consacrée à la production de visualisations avec `Python`. Après avoir récupéré et nettoyé des données, on désire généralement synthétiser celles-ci par le biais de tableaux, de productions graphiques ou de cartes. Cette partie est une introduction rapide à ce sujet (["Communiquer avec `Python`"](/content/visualisation/index.qmd)). Assez introductive, l'objectif de cette partie est surtout de donner quelques notions qui sont consolidées par la suite.

La troisième partie est consacrée à la modélisation à travers l'exemple fil rouge de la science électorale (["Modéliser avec `Python`"](/content/modelisation/index.qmd)). L'objectif de cette partie est d'illustrer la démarche scientifique du _machine learning_, les choix méthodologiques et techniques afférents et ouvrir vers les enjeux suivants qui seront évoqués dans la suite du cursus universitaire.

La quatrième partie du cours fait un pas de côté pour se consacrer aux enjeux spécifiques liés à l'exploitation des données textuelles. Il s'agit du chapitre d'["Introduction au _Natural Language Processing (NLP)"_ avec `Python`"](/content/NLP/index.qmd). Ce champ de recherche étant particulièrement actif, il ne s'agit que d'une introduction au sujet. Pour aller plus loin, se référer à @RN2020, chapitre 24.

Ce chapitre propose aussi une partie consacrée au contrôle de version avec le logiciel `Git` {{< fa brands git-alt >}} ([Découvrir `Git`](/content/git/index.qmd)). Pourquoi proposer ce contenu dans le cadre d'un cours de `Python` {{< fa brands python >}} ? Car apprendre `Git` permettra de produire de meilleurs codes `Python`, de les échanger, voire même de les tester dans des environnements reproductibles ou de mettre à disposition les résultats en ligne (c'est une utilisation plus avancée, objet du cours de [mise en production](https://ensae-reproductibilite.github.io/)). Ce pas de côté dans l'apprentissage de `Python` est très utile, _a fortiori_ dans un monde où [`Github`](https://github.com/) sert de vitrine et où les entreprises et administrations exigent, à juste titre, que leurs _data scientists_ sachent faire du `Git`.

:::


::: {.content-visible when-profile="en"}
# Course Outline

This course serves as an introduction to the core challenges of _data science_ through learning the `Python` programming language. As the term _“data science”_ implies, a significant portion of the course is dedicated to working directly with data: retrieving it, structuring it, exploring it, and combining it.

These topics are covered in the first part of the course, [“Manipulating Data”](/content/manipulation/index.qmd), which lays the foundation for everything that follows. Unfortunately, many training programs in _data science_, applied statistics, or the economic and social sciences tend to overlook this crucial aspect of a data scientist’s work—often referred to as [“data wrangling”](https://en.wikipedia.org/wiki/Data_wrangling) or [_“feature engineering”_](https://en.wikipedia.org/wiki/Feature_engineering). And yet, not only does it represent a large share of the day-to-day work in data science, it’s also essential for building relevant and accurate models.

The goal of this first section is to highlight the challenges involved in accessing and leveraging different types of data sources using `Python`. The examples are diverse, reflecting the variety of data that can be analyzed with `Python`: municipal $CO_2$ emissions in France, real estate transaction records, housing energy performance diagnostics, bike-sharing data from the Velib system, and more.

The second part of the course focuses on creating visualizations with `Python`. Once your data has been cleaned and processed, you'll typically want to summarize it—through tables, graphs, or maps. This part, [“Communicating with Python”](/content/visualization/index.qmd), offers a concise introduction to the topic. While somewhat introductory, it provides essential concepts that will be reinforced later in the course.

The third part centers on modeling, using electoral science as the main example ([“Modeling with Python”](/content/modelisation/index.qmd)). This section introduces the scientific reasoning behind _machine learning_, explores both methodological and technical choices, and sets the stage for deeper topics addressed later in the program.

The fourth part takes a step back to focus on the specific challenges of working with text data. This is the [“Introduction to Natural Language Processing (NLP) with Python”](/content/NLP/index.qmd) chapter. Given that NLP is a rapidly evolving field, this section serves only as an introduction. For more advanced coverage, see @RN2020, chapter 24.

This chapter also includes a section on version control with `Git` {{< fa brands git-alt >}} ([Discover `Git`](/content/git/index.qmd)). Why include this in a course about `Python` {{< fa brands python >}}? Because learning `Git` helps you write better code, collaborate effectively, and test or share your work in reproducible environments. This is especially valuable in a world where platforms like [`GitHub`](https://github.com/) act as professional showcases—and where companies and public institutions increasingly expect their _data scientists_ to be proficient with `Git`.

For more advanced applications, including deployment and reproducibility, refer to the companion course on [putting data science projects into production](https://ensae-reproductibilite.github.io/).

:::




::: {.content-visible when-profile="fr"}
# Références {-}
:::

::: {.content-visible when-profile="en"}
# References {-}
:::

::: {#refs}
:::

---
jupyter:
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---
