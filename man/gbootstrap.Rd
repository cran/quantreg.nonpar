\name{gbootstrap}
\alias{gbootstrap}

\title{
Gradient Bootstrap Inference for NPQR
}
\description{
A method for the generic function \code{\link{npqr}}. It computes, via a gradient bootstrap method, the t-statistic used to conduct inference in nonparametric series quantile regression models, as well as outputting confidence intervals and hypothesis test p-values at a user-specified level.
}
\usage{
gbootstrap(data = data, B = B, taus, formula, basis = NULL, alpha = 0.05, 
	var, load, rearrange=F, rearrange.vars="quantile", uniform=F, 
	average=T, nderivs=1, method = "fn")
}

\arguments{
  \item{data}{
a data.frame in which to interpret the variables named in the \code{formula} argument.
}
  \item{B}{
the number of bootstrap repetitions to be performed.
}
  \item{taus}{
a numerical vector, whose entries are strictly between 0 and 1, containing the quantile indexes  of interest.
}
  \item{formula}{
a formula object, with the response Y on the left of a ~ operator, and the covariate terms, separated by + operators on the right, not including the regressor whose effect is to be estimated nonparametrically. Operators such as '*', ':', 'log()', and 'I()' are allowable. However, factor variables should be constructed prior to entry in the formula: the 'factor()' operator is not allowable.
}
  \item{basis}{
either a basis generated using the \code{fda} package of type "bspline" or "fourier", a factor variable, or an orthogonal polynomial basis generated using the \code{poly} command. This basis is the series regressor to be added to \code{formula}.
}
  \item{alpha}{
a real number between 0 and 1: the desired significance level (e.g., 0.05).
}
  \item{var}{
a column name within \code{data} whose values will be used, in combination with \code{basis}, to create the vectors used in the nonparametric part of the model.
}
  \item{load}{
optional manual input of loading vector (or matrix of loading vectors) that will be used as data points at which inference will be performed and over which hypothesis tests will be conducted. Each vector of \code{load} should be input as the concatenation of vectors whose entries correspond to the entries of \eqn{v} and \eqn{Z(w)}, respectively (for example, the average values of each variable for the parametric part of the model, \eqn{v}, and a specific point for the nonparametric part of the model, \eqn{Z(w)}).
}
  \item{rearrange}{
a boolean specifiying whether estimates will be monotonized prior to performing inference (requires that \code{average=FALSE} and \code{nderivs=0}).
}
  \item{rearrange.vars}{
if \code{rearrange = TRUE}, specifies whether monotonization will occur over "quantile", "var" (the variable of interest), or "both".
}
  \item{uniform}{
a boolean specifying whether inference will be uniform across observations and quantiles or done in a pointwise manner.
}
  \item{average}{
if \code{load} is not input, if \code{average=TRUE}, specifies that inference should be performed on the average value of a derivative (as specified by \code{nderivs}) of the conditional quantile function (inference cannot be performed when \code{average=TRUE} and \code{nderivs=0}). If \code{average=FALSE}, inference will be run at each unique value of the variable of interest in the dataset.
}
  \item{nderivs}{
the number of derivatives of the conditional quantile function upon which inference should be performed.
}
  \item{method}{
method to be implemented in quantile regressions: passed to function \code{rq}.
}
}
\value{
	\code{gbootstrap} returns a list containing the following elements:
	\item{qfits}{a list whose length is equal to the length of \code{taus}. Each element is an \code{rq.object} returned by \code{rq} for the corresponding quantile.}
	\item{point.est}{a matrix containing the point estimates of interest (e.g., the average derivative of the function) for each pair of loading vectors and \code{taus}.  The matrix is j by i, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified.}
	\item{var.unique}{a vector containing all values of the covariate of interest with no repeated values.}
	\item{CI}{an array containing the two-sided confidence interval for each pair of loading vectors and \code{taus}.  The array is j by i by 2, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified. The final dimension  indexes the lower and upper bounds of the confidence interval, respectively.}
	\item{CI.oneSided}{an array containing the one-sided confidence bounds for each pair of loading vectors and \code{taus}.  The array is j by i by 2, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified. The final dimension  indexes the lower and upper confidence bounds, respectively.}
	\item{std.error}{a matrix containing estimated standard errors for the quantile regression point estimates for each pair of loading vectors and \code{taus}.  The array is j by i, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified.}
	\item{pvalues}{a vector containing the p-values for hypothesis tests of three null hypotheses. First, that theta(tau,w) <= 0 for all (tau,w) pairs, where theta is the quantity of interest (e.g., the derivative of the function at each quantile and at each observation). Second, that theta(tau,w) >= 0 for all (tau,w) pairs. Third, that theta(tau,w) = 0 for all (tau,w) pairs.}
	\item{load}{the loading vector or matrix of loading vectors used as data points at which inference was performed and over which hypothesis tests were conducted. If \code{load} was not input by the user, \code{load} is generated based on \code{average} and \code{nderivs}.}
}
\references{
Belloni, A., Chernozhukov, V., and I. Fernandez-Val (2011), "Conditional quantile processes based on series or many regressors," arXiv:1105.6154.
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val
}
\seealso{
	\code{\link{npqr}}
}
\keyword{regression}
\keyword{nonparametric}
