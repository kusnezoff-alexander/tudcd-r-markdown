---
title: Is 5G a Battery Drainer?
bibliography: paper.bib
link-citations: TRUE
csl: utils/ieee.csl
author: Alexander Kusnezoff
theme: tud
date: 16.07.2024
number_sections: true
classoption: twocolumn
mainfontfallback:
  - "NotoColorEmoji:mode=harf"
---

# title

## Start with Why?

Test1

\pause <!--show following text only on next slide-->

Text2

## Start with Why?

\begin{center}
\includegraphics[width=0.8\textwidth]{./img/prosem-einleitung.png}
\end{center}

## Slide 3


Test3

## Small Font


\begingroup
\tiny <!--alternatives: `/footnotesize`,`/scriptsize` (smaller), `\tiny` (very small), `\smalll`)-->
<!--or set fontsize manually with: `\fontsize{4pt}{5pt}\selectfont`-->

Tiny text..

\endgroup

# Neue Section

## HMMM

## Twocols

This is how to specify several cols on a slide:

<!-- see [StackOverflowI](https://stackoverflow.com/a/34809186) for twocol-layout -->

:::::::::::::: {.columns}
::: {.column width="40%"}

contents...

:::
::: {.column width="60%"}

contents...

:::
::::::::::::::

## Extra Symbols

- ✓ 🧠, 📙
- Other alphabets: ソ, Я

"my quote" @PXJVWCSQ#computedram19 <!--Chap1-->

## Mermaid

```mermaid
graph TD;
    A[Start] --> B{Is it sunny?};
    B -- Yes --> C[Go outside];
    B -- No --> D[Stay inside];
    C --> E[Have fun];
    D --> E;
```

# End

<!-- --- -->
<!-- refs: | -->
<!--    ::: {#refs} -->
<!--    ::: -->
<!-- ... -->

## References {.allowframebreaks}

\footnotesize
