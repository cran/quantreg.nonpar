\name{removeI}
\alias{removeI}

\title{
Remove I() Tags From Formula
}
\description{
Remove I() tags from a formula. Used in the process of computing the symbolic derivative of the right hand side of a formula.
}
\usage{
removeI(inString)
}
\arguments{
  \item{inString}{
a character object
}
}
\value{
\code{removeI} returns a character object identical to \code{inString} but with any I() tags removed
}
\author{
Michael Lipsitz, Alexandre Belloni, Victor Chernozhukov, Ivan Fernandez-Val
}

\seealso{
\code{\link{formulaDeriv}}
}