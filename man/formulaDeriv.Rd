\name{formulaDeriv}
\alias{formulaDeriv}
\title{
Derivative of Right Hand Side of Formula
}
\description{
Takes the symbolic derivative (or multiple derivatives) of the right hand side of a formula and returns a matrix with the derivative evaluated at each observation in a dataset
}
\usage{
formulaDeriv(inFormula, derivVar, data, nDerivs = 1)
}
\arguments{
  \item{inFormula}{
a formula object, with the response Y on the left of a ~ operator, and the covariate terms, separated by + operators on the right, not including the regressor whose effect is to be estimated nonparametrically. Operators such as '*', ':', 'log()', and 'I()' are allowable. However, factor variables should be constructed prior to entry in the formula: the 'factor()' operator is not allowable.
}
  \item{derivVar}{
a character object giving the name of the variable with respect to which the derivative will be taken.
}
  \item{data}{
a data.frame in which to interpret the variables named in the \code{formula} and \code{derivVar} arguments.
}
  \item{nDerivs}{
an integer: the number of derivatives to be taken.
}
}
\value{
\code{formulaDeriv} returns a matrix whose dimensions are the number of observations in \code{data} and the number of variables on the right hand side of \code{formula}. Each row is the derivative of \code{formula} evaluated at the corresponding observation in \code{data}
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val
}

\seealso{
\code{\link{npqr}}
}