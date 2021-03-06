% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/akmbiclust.R
\name{akmbiclust}
\alias{akmbiclust}
\title{Alternating k-means biclustering}
\usage{
akmbiclust(X, k, lambda = 0, nstart = 1)
}
\arguments{
\item{X}{Data matrix.}

\item{k}{The number of biclusters.}

\item{lambda}{Regularization parameter. Default is 0.}

\item{nstart}{The number of random initializations. Default is 1.}
}
\value{
A list containing three objects:
\item{row_labels}{The bicluster labels of every row.}
\item{col_labels}{The bicluster labels of every column.}
\item{loss}{The loss of the produced biclusters.}
}
\description{
This function uses the alternating k-means biclustering algorithm to
extract the k biclusters in the matrix X. See the paper
"Biclustering with Alternating K-Means" for more details.
}
\examples{
# we create a 100 by 100 matrix X which has an underlying 2 by 2 block structure.
# The entries in the two 50 by 50 blocks on the top left and bottom right follow
# i.i.d. normal with mean 0 and variance 4. The entries in the two 50 by 50 blocks
# on the top right and bottom left follow i.i.d. normal with mean 0 and variance 1.

X <- matrix(rnorm(10000, 0, 1), 100, 100)
X[1:50, 1:50] <- matrix(rnorm(2500, 0, 2), 50, 50)
X[51:100, 51:100] <- matrix(rnorm(2500, 0, 2), 50, 50)

# Alternating k-means biclustering
# Result: perfect
result <- akmbiclust(X, 2, lambda = 0, nstart = 100)
result$row_labels
result$col_labels

# Separate k-means clustering on the rows and columns
# Result: random
kmeans(X, 2)$cluster
kmeans(t(X), 2)$cluster
}
\references{
N. Fraiman and Z. Li (2020). Biclustering with Alternating K-Means.
arXiv preprint arXiv:2009.04550.
}
\author{
Nicolas Fraiman and Zichao Li
}
