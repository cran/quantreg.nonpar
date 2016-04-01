\name{ddpoly}
\alias{ddpoly}
\title{
Compute Second Derivative of Orthogonal Polynomials
}
\description{
	Returns or evaluates the second derivatives of orthogonal polynomials of degree 1 to \code{degree} over the specified set of points \code{x}: the polynomials are all orthogonal to the constant polynomial of degree 0. Alternatively, evaluates the second derivatives of raw polynomials.
}
\usage{
ddpoly(x, ..., degree = 1, coefs = NULL, raw = FALSE)
}
\arguments{
  \item{x}{
a numeric vector at which to evaluate the polynomial. \code{x} can also be a matrix. Missing values are not allowed in \code{x}.
}
  \item{\dots}{
further vectors.
}
  \item{degree}{
the degree of the polynomial. Must be less than the number of unique points if \code{raw = TRUE}.
}
  \item{coefs}{
for prediction, coefficients from a previous fit.
}
  \item{raw}{
if true, use raw and not orthogonal polynomials.
}
}
\value{
A matrix with rows corresponding to points in \code{x} and columns corresponding to the degree, with attributes \code{"degree"} specifying the degrees of the columns (prior to taking the derivatives) and (unless \code{raw = TRUE}) \code{"coefs"} which contains the centering and normalization constants used in constructing the orthogonal polynomials. The matrix has been given class \code{c("poly","matrix")}.
}
\references{
Chambers, J.M. and Hastie, T.J. (1992) Statistical Models in S. Wadsworth & Brooks/Cole.
Kennedy, W.J. Jr and Gentle, J.E. (1980) Statistical Computing. Marcel Dekker.
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val
}
\note{
	Both the code and the description of \code{ddpoly} borrow heavily from the \code{poly} command in the \code{stats} package.
}
\seealso{
\code{\link[stats]{poly}}, \code{\link{dpoly}}
}
