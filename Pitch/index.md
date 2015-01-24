---
title       : The population of the Netherlands
subtitle    : An exercise with Shiny Apps and Slidify
author      : Ed van Gasteren
job         : Data scientist to be
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

Shiny is a web application framework for R (see http://shiny.rstudio.com/). It is great and very easy to turn an analyses done with R into an interactive web application.

Slidify is a framework for making presentations (see http://slidify.org/). It uses a very ease markup "language" and integrates with other tools to make stunning presentations.

Both shiny and slidify are well intergrated with Rstudio (see http://www.rstudio.com/). It's a small step from your analysis in R to either presenting it (slidify) or to have others use it (shiny).

This very simple, not so stunning, presentation is done with slidify. It's about a simple web application build with shiny based on an analyses of the population of the Netherlands over time.

---

## The question bothering you ...

### How big was the population of the Netherlands on my birthdate?

Look no further.

### Surf to https://evgaster.shinyapps.io/NLpopulation/.

Just fill in the date.

The application will tell you and show you.

Fill in an other date. The application will dynamically adjust.

### Curious?

Read on ...

---

## Behind the scenes

### For the impatient
The code is available at https://github.com/evgaster/NLpopulation

It shows that what you can do with a few R commands, can be wrapped with a few (really just a few) other R commands and turned into a web application.

It is little more then the familiar: load data; fit a model; predict; present. 

The server side (no need to get scared) does the load and fit; waits for the user interface side (again, no need to get scared) to give it a new X value; predicts a corresponding Y; hands the results to the user interface; the user interface shows it to you.

---

## A peek at the server side

The server loads an preprocesses the data (not shown). The date looks like:

```
##         date population
## 1 1950-01-01   10026773
## 2 1951-01-01   10200280
## 3 1952-01-01   10328343
```

It then fits a model to the data. Subsequently it prodicts a new population value for a given date.

```r
f <- lm(population ~ date, data = d)
predict(f, data.frame(date = as.Date("1958-06-10")))
```

```
##        1 
## 11445548
```

In the application the given date comes from the user interface and the prediction goes back to it.
