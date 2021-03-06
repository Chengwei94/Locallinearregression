% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cv.llr.R
\name{cv.llr}
\alias{cv.llr}
\title{Bandwidth selection using k-fold cross validation}
\usage{
cv.llr(
  x,
  y,
  weight,
  kernel = "epanechnikov",
  bw = seq(0.05, 0.4, by = 0.01),
  kdtree = FALSE,
  approx = FALSE,
  epsilon = 0.05,
  N_min = 1,
  k = 5
)
}
\arguments{
\item{x}{a numeric vector or matrix of x data}

\item{y}{a numeric vector of y data corresponding to \code{x} data}

\item{weight}{a numeric vector of \code{length(x)} for weight of each data point.}

\item{kernel}{kernel type used; supported are 'epanechnikov', "rectangular", "triangular", "quartic", "triweight", "tricube", "cosine", "gauss", "logistic". "sigmoid" and "silverman".}

\item{bw}{a numeric vector or matrix of bandwidth considered for selection.}

\item{kdtree}{boolean flag: If \code{TRUE}, a kdtree is used for computation of local linear regression.}

\item{approx}{boolean flag: if \code{TRUE} kdtree approximation is used.}

\item{epsilon}{margin of error allowed for llr approximation using kdtree. Only used when \code{kdtree = TRUE} and \code{approx = TRUE}.}

\item{N_min}{minimum number of points stored in the kd-tree. Only used when \code{kdtree = TRUE} and \code{approx} = TRUE.}

\item{k}{number of folds used for cross validation}
}
\value{
returns a single numeric value or vector of \code{bw} that gives the smallest mean square error from cross validation.
}
\description{
Bandwidth selection using k-fold cross validation
}
\examples{
n <- 1000
x <- seq(0,10,length.out = n)
x1 <- rnorm(n,0,0.2)
y <- sin(x) + x1
w <- rep(1/n, n)
binned <- bin(x,y,bins=400, w)
## Bandwidth selection of binned data
h_bin <- cv.llr(binned$x, binned$y, binned$weight)
## Bandwidth selection of exact local linear regression
h_exact <- cv.llr(x, y, w)
## Bandwidth selection of exact local linear regression with kdtree
h_kdexact <- cv.llr(x, y, w, kdtree = TRUE, approx = FALSE)
## Bandwidth selection of approx local linear regression with kdtree
h_kdapprox <- cv.llr(x, y, w , kdtree = TRUE , approx = TRUE) 
}
