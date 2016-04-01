\name{poly.wrap}
\alias{poly.wrap}
\title{
Orthogonal Polynomial Wrapper
}
\description{
A wrapper for \code{poly}, \code{dpoly}, and \code{ddpoly}.
}
\usage{
poly.wrap(x, degree = 1, coefs = NULL, nderivs = 1, raw = FALSE)
}
\arguments{
  \item{x}{
a numeric vector at which to evaluate the polynomial. \code{x} can also be a matrix. Missing values are not allowed in \code{x}.
}
  \item{degree}{
the degree of the polynomial. Must be less than the number of unique points if \code{raw = TRUE}.
}
  \item{coefs}{
for prediction, coefficients from a previous fit.
}
  \item{nderivs}{
	allowable values are 0, 1, and 2. If \code{nderivs = 0}, all other arguments are passed to \code{poly}. If \code{nderivs = 1}, all other arguments are passed to \code{dpoly}. If \code{nderivs = 2}, all other arguments are passed to \code{ddpoly}.
}
  \item{raw}{
if true, use raw and not orthogonal polynomials.
}
}
\value{
\code{poly.wrap} returns the value returned by \code{poly}, \code{dpoly}, or \code{ddpoly}, depending on the value of \code{nderivs}.
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val
}
\seealso{
\code{\link[stats]{poly}}, \code{\link{dpoly}}, \code{\link{ddpoly}}
}