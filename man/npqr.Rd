\name{npqr}
\alias{npqr}
\title{
Nonparametric Series Quantile Regression
}
\description{
Implements the nonparametric quantile regression methods developed by Belloni, Chernozhukov, and Fernandez-Val (2011) to partially linear quantile models, \eqn{Y=g(w,u)+v'\gamma(u)}, \eqn{u|v,w~U[0,1]}. Provides point estimates of the conditional quantile function and its derivatives based on series approximations to the nonparametric part of the model, \eqn{g(w,u)}, approximated by \eqn{Z(w)'\beta(u)}. Provides pointwise and uniform confidence intervals using analytic and resampling methods.}
\usage{
npqr(formula, data, basis = NULL, var, taus = c(0.25, 0.5, 0.75), 
	print.taus = NULL, B = 200, nderivs = 1, average = T, 
	load = NULL, alpha = 0.05, process = "pivotal", rearrange = F, 
	rearrange.vars="quantile", uniform = F, se = "unconditional", 
	printOutput = T, method = "fn")
}
\arguments{
  \item{formula}{
a formula object, with the response Y on the left of a ~ operator, and the covariate terms, separated by + operators on the right, not including the regressor whose effect is to be estimated nonparametrically. Operators such as '*', ':', 'log()', and 'I()' are allowable. However, factor variables should be constructed prior to entry in the formula: the 'factor()' operator is not allowable.
}
  \item{data}{
a data.frame in which to interpret the variables named in the \code{formula} and \code{var} arguments.  Observations in \code{data} used to construct the loading vector (either manually or automatically) will be hereafter referred to as w.
}
  \item{basis}{
a nonparametric basis object (created with the package \code{fda}), an orthogonal polynomial basis of class \code{"poly"}, or a factor variable that will be used to estimate the effect of \code{var}.
}
  \item{var}{
a column name within \code{data} whose values will be used, in combination with \code{basis}, to create the vectors used in the nonparametric part of the model.
}
  \item{taus}{
a vector of quantiles of interest.
}
  \item{print.taus}{
a vector of quantiles (which must be a subset of \code{taus}), estimates for which will be printed as output.
}
  \item{B}{
the number of simulations (for the pivotal and gaussian methods) or bootstrap repetitions (for the weighted bootstrap and gradient bootstrap methods) to be performed.
}
  \item{nderivs}{
if \code{load} is not input, the number of derivatives of the conditional quantile function upon which inference should be performed.
}
  \item{average}{
if \code{load} is not input, if \code{average=TRUE}, specifies that inference should be performed on the average value of a derivative (as specified by \code{nderivs}) of the conditional quantile function (inference cannot be performed when \code{average=TRUE} and \code{nderivs=0}). If \code{average=FALSE}, inference will be run at each unique value of the variable of interest in the dataset.
}
  \item{load}{
optional manual input of loading vector (or matrix of loading vectors) that will be used as data points at which inference will be performed and over which hypothesis tests will be conducted. Each vector of \code{load} should be input as the concatenation of vectors whose entries correspond to the entries of \eqn{v} and \eqn{Z(w)}, respectively (for example, the average values of each variable for the parametric part of the model, \eqn{v}, and a specific point for the nonparametric part of the model, \eqn{Z(w)}).
}
  \item{alpha}{
a real number between 0 and 1: the desired significance level (e.g., 0.05).
}
  \item{process}{
either "pivotal", "gaussian", "wbootstrap", "gbootstrap", or "none": specifies the process used to estimate confidence intervals and p-values of hypothesis tests (or, if \code{process = "none"}, specifies that inference should not be performed).
}
  \item{rearrange}{
a boolean specifiying whether estimates will be monotonized prior to performing inference (requires that \code{average=FALSE} and \code{nderivs=0}).
}
  \item{rearrange.vars}{
if \code{rearrange = TRUE}, specifies whether monotonization will occur over "quantile", "var" (the variable of interest), or "both".
}
  \item{uniform}{
a boolean specifying whether inference will be done uniformly across observations and quantiles or in a pointwise manner.
}
  \item{se}{
either "conditional" or "unconditional". Specifies whether standard errors, for pivotal and gaussian methods, will be conditional on the sample or not.
}
  \item{printOutput}{
a boolean specifying whether or not output will be printed.
}
  \item{method}{
method to be implemented in quantile regressions: passed to function \code{rq}.
}
}
\details{
The loading vector may be specified in one of two ways: it may be input manually with \code{load}. If \code{load} is not specified, the loading vector will be calculated automatically using \code{average} and \code{nderivs} as parameters.

Note that derivatives calculated automatically will always be with respect to the nonparametric variable of interest, \code{var}. This means that, for example, if \code{var=logprice}, where \code{logprice} is the natural logarithm of price, then the derivative will be taken with respect to \code{logprice}, not with respect to \code{price}.  Specification of \code{var} will not admit mathematical functions such as \code{log}.  Specification of \code{formula} will admit some functions (e.g., \code{log}, multiplication of covariates, interaction of covariates). However, formula will not admit some formula operators; in particular, factor variables must be saved as new variables prior to entry into formula. See the vignette for more information.
}
\value{
returns a list of results
\item{CI}{an array containing the two-sided confidence interval for each pair of loading vectors and \code{taus}.  The array is j by i by 2, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified. The final dimension  indexes the lower and upper bounds of the confidence interval, respectively.}
\item{CI.oneSided}{an array containing the one-sided confidence bounds for each pair of loading vectors and \code{taus}.  The array is j by i by 2, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified. The final dimension  indexes the lower and upper confidence bounds, respectively.}
\item{point.est}{a matrix containing the point estimates of interest (e.g., the average derivative of the conditional quantile function) for each pair of loading vectors and \code{taus}.  The matrix is j by i, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified.}
\item{std.error}{a matrix containing estimated standard errors for the point estimates for each pair of loading vectors and \code{taus}.  Depending on user selections, these may be conditional on the sample or unconditional. The array is j by i, where j is the number of loading vectors specified (i.e., the number of observations in the dataset if \code{average=FALSE} and 1 if \code{average=TRUE}) and i is the number of \code{taus} specified.}
\item{pvalues}{a vector containing the p-values for hypothesis tests of three null hypotheses. First, that theta(tau,w) <= 0 for all (tau,w) pairs, where theta is the quantity of interest (e.g., the derivative of the function at each quantile and at each observation). Second, that theta(tau,w) >= 0 for all (tau,w) pairs. Third, that theta(tau,w) = 0 for all (tau,w) pairs.}
\item{taus}{This is the input vector of quantile indexes.}
\item{coefficients}{a list of length equal to the number of \code{taus} specified.  Each element of the list contains the coefficients from the nonparametric quantile regression performed at the corresponding \code{taus}.}
\item{var.unique}{a vector containing all values of the covariate of interest with no repeated values.}
\item{load}{the loading vector or matrix of loading vectors used as data points at which inference was performed and over which hypothesis tests were conducted. If \code{load} was not input by the user, \code{load} is generated based on \code{average} and \code{nderivs}.}
}
\references{
Belloni, A., Chernozhukov, V., and I. Fernandez-Val (2011), "Conditional quantile processes based on series or many regressors," arXiv: 1105:6154.

Koenker, R. (2011), "Additive models for quantile regression: Model selection and confidence bandaids," Brazilian Journal of Probability and Statistics 25(3), pp. 239-262.

Koenker, R. and G. Bassett (1978): "Regression Quantiles," Econometrica 46, pp. 33-50.

Ramsay, J.O., Wickham, H., Graves, S., and G. Hooker (2013), "fda: Functional Data Analysis," R package version 2.3.6, http://CRAN.R-project.org/package=fda
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val
}

\seealso{
\code{\link[quantreg]{rq}}
}
\examples{
data(india)

## Subset the data for speed
india.subset<-india[1:1000,]

formula=cheight~mbmi+breastfeeding+mage+medu+edupartner
  
basis.bsp <- create.bspline.basis(breaks=quantile(india$cage,c(0:10)/10))
  
n=length(india$cage)
B=500
alpha=.95
taus=c(1:24)/25
print.taus=c(1:4)/5

## Inference on average growth rate

piv.bsp <- npqr(formula=formula, data=india.subset, basis=basis.bsp, 
	var="cage", taus=taus, print.taus=print.taus, B=B, nderivs=1, 
	average=1, alpha=alpha, process="pivotal", rearrange=FALSE, 
	uniform=TRUE, se="unconditional", printOutput=TRUE, method="fn")

yrange<-range(piv.bsp$CI)
xrange<-c(0,1)
plot(xrange,yrange,type="n",xlab="",ylab="Average Growth (cm/month)")
lines(piv.bsp$taus,piv.bsp$point.est)
lines(piv.bsp$taus,piv.bsp$CI[1,,1],col="blue")
lines(piv.bsp$taus,piv.bsp$CI[1,,2],col="blue")
title("Average Growth Rate")

## Estimation on average growth acceleration with no inference

piv.bsp.secondderiv <- npqr(formula=formula, data=india.subset, 
	basis=basis.bsp, var="cage", taus=taus, print.taus=print.taus, 
	B=B, nderivs=2, average=0, alpha=alpha, process="none", 
	se="conditional", rearrange=FALSE, printOutput=FALSE, method="fn")

xsurf<-as.vector(piv.bsp.secondderiv$taus)
ysurf<-as.vector(piv.bsp.secondderiv$var.unique)
zsurf<-t(piv.bsp.secondderiv$point.est)

persp(xsurf, ysurf, zsurf, xlab="Quantile", ylab="Age (months)",
	zlab="Growth Acceleration", ticktype="detailed", phi=30, 
	theta=120, d=5, col="green", shade=0.75, main="Growth Acceleration")

}
\keyword{nonparametric}
\keyword{regression}
\keyword{htest}