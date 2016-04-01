\name{quantreg.nonpar-package}
\alias{quantreg.nonpar-package}
\alias{quantreg.nonpar}
\docType{package}
\title{
Nonparametric Series Quantile Regression
}
\description{
Implements the nonparametric quantile regression methods developed by Belloni, Chernozhukov, and Fernandez-Val (2011) to partially linear quantile models. Provides point estimates of the conditional quantile function and its derivatives based on series approximations to the nonparametric part of the model. Provides pointwise and uniform confidence intervals using analytic and resampling methods.}
\details{
\tabular{ll}{
Package: \tab quantreg.nonpar\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-11-05\cr
License: \tab GPL(>=2)\cr
}
This package is used to generate point estimates and uniform and pointwise confidence intervals in nonparametric series quantile regression models. One may use \code{\link{npqr}} to generate such estimates and confidence intervals and test hypotheses on the conditional quantile function and its derivatives.
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val 

Maintainer: Ivan Fernandez-Val <ivanf@bu.edu>
}
\references{
Belloni, A., Chernozhukov, V., and I. Fernandez-Val (2011), "Conditional quantile processes based on series or many regressors," arXiv: 1105:6154.

Koenker, R. (2011), "Additive models for quantile regression: Model selection and confidence bandaids," Brazilian Journal of Probability and Statistics 25(3), pp. 239-262.

Koenker, R. and G. Bassett (1978): "Regression Quantiles," Econometrica 46, pp. 33-50.

Ramsay, J.O., Wickham, H., Graves, S., and G. Hooker (2013), "fda: Functional Data Analysis," R package version 2.3.6, http://CRAN.R-project.org/package=fda
}
\keyword{nonparametric}
\keyword{regression}
\keyword{htest}
