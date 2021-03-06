# ECoL
[![Travis-CI Build Status](https://travis-ci.org/lpfgarcia/ECoL.svg?branch=master)](https://travis-ci.org/lpfgarcia/ECoL)
[![codecov](https://codecov.io/gh/lpfgarcia/ECoL/branch/master/graph/badge.svg)](https://codecov.io/gh/lpfgarcia/ECoL)
[![CRAN](https://www.r-pkg.org/badges/version/ECoL)](https://CRAN.R-project.org/package=ECoL)

The Extended Complexity Library (ECoL) is the implementation in R of a set of measures to characterize the complexity of classification and regression problems based on aspects that quantify the linearity of the data, the presence of informative feature, the sparsity and dimensionality of the datasets. The measures were originally proposed by Ho and Basu [1] and extend by many other works including the DCoL library [2]. The main difference between the libraries is that ECoL provides bug fixes, generalizations and implementations of many other state-of-the-art measures.

## Measures

The measures can be divided into two groups: classification and regression measures. The classification measures are based on:  (1) feature-based measures, (2) neighborhood measures, (3) linearity measures, (4) dimensionality measures, (5) class balance measures and (6) network measures. The regression measures are based on: (3) linearity measures, (4) dimensionality measures, (7) correlation measures and (8) smoothness measures.

**Feature-based measures** 

* F1: Fisher's discriminant ratio
* F1v: The directional-vector Fisher's discriminant ratio
* F2: Overlapping of the per-class bounding boxes
* F3: Maximum individual feature efficiency
* F4: Cllective feature efficiency

**Neighborhood information** 

* N1: Fraction of points lying on the class boundary
* N2: Average intra/inter class nearest neighbor distances
* N3: Leave-one-out error rate of the 1-nearest neighbor algorithm
* N4: Nonlinearity of the one-nearest neighbor classifier
* N5: Fraction of maximum covering spheres on data
* N6: Local-Set cardinality average

**Linearity** 

* L1: Distance of erroneous instances to a linear classifier
* L2: Training error of a linear classifier
* L3: Nonlinearity of a linear classifier

**Dimensionality**

* D1: Average number of samples per dimension
* D2: Average intrinsic dimensionality  per number of examples
* D3: Intrinsic dimensionality proportion

**Class balance**

* B1: Entropy of class proportions
* B2: Multi-class imbalance ratio

**Structural representation**

* G1: Average density of network
* G2: Clustering Coefficient
* G3: Average hub score

**Feature correlation**

* C1: Feature correlation to the output
* C2: Average feature correlation to the output
* C3: Individual feature efficiency
* C4: Collective feature efficiency

**Smoothness**

* S1: Output distribution
* S2: Input distribution
* S3: Error of a nearest neighbor regressor
* S4: Non-linearity of nearest neighbor regressor

## Installation

The installation process is similar to other packages available on CRAN:

```r
install.packages("ECoL")
```

It is possible to install the development version using:

```r
if(!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("lpfgarcia/ECoL")
library("ECoL")
```

## Example of use

The simplest way to compute the complexity measures are using the `complexity` method. The method can be called by a symbolic description of the model or by a data frame. The parameters are the dataset the group of measures to be extracted and the summarization functions. If it is a classification task, the response needs to be a factor, otherwise the package will assume a regression task. The default paramenter is extract all the measures. To extract a specific measure, use the function related with the group. A simple example is given next:

```r
## Extract all complexity measures for classification task
complexity(Species ~ ., iris)

## Extract all complexity measures for regression task
complexity(speed ~., cars)

## Extract all complexity measures using data frame for classification task
complexity(iris[,1:4], iris[,5])

## Extract the feature-bases measures
complexity(Species ~ ., iris, groups="featurebased")

## Extract the F1 measure using feature-bases function
featurebased(Species ~ ., iris, measures="F1")
```
Several measures return more than one value. To aggregate the returned values, post processed methods can be used. This method can compute `min`, `max`, `mean`, `median`, `kurtosis`, `standard deviation`, among others (see the `post.processing` documentation for more details). The default methods are the `mean` and the `sd`. Next, it is possible to see an example of the use of this method:

```r
## Extract all measures using min, median and max for classification task
complexity(Species ~ ., iris, summary=c("min", "median", "max"))

## Extract all measures using min, median and max for regression task
complexity(speed ~., cars, summary=c("min", "median", "max"))

```

## Developer notes

To cite `ECoL` in publications use: 

* Lorena, A. C., Garcia, L. P. F., Lehmann, J., Souto, M. C. P., and Ho, T. K. (2019). How Complex Is Your Classification Problem?: A Survey on Measuring Classification Complexity. ACM Computing Surveys (CSUR), 52:1-34.

* Lorena, A. C., Maciel, A. I., de Miranda, P. B. C., Costa, I. G., and Prudêncio, R. B. C. (2018). Data complexity meta-features for regression problems. Machine Learning, 107(1):209-246.

To submit bugs and feature requests, report at [project issues](https://github.com/lpfgarcia/ECoL/issues).

## References

[1] Ho, T., and Basu, M. (2002). Complexity measures of supervised classification problems. IEEE Transactions on Pattern Analysis and Machine Intelligence, 24(3):289-300.

[2] Orriols-Puig, A., Maciá, N., and Ho, T. (2010). Documentation for the data complexity library in C++. Technical report, La Salle - Universitat Ramon Llull.

[3] R Core Team (2018). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.
