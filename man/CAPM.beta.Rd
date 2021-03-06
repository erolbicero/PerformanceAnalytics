% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CAPM.beta.R
\name{CAPM.beta}
\alias{CAPM.beta}
\alias{CAPM.beta.bull}
\alias{CAPM.beta.bear}
\alias{TimingRatio}
\alias{SFM.beta}
\alias{CAPM.beta.bull}
\alias{CAPM.beta.bear}
\alias{TimingRatio}
\title{calculate single factor model (CAPM) beta}
\usage{
CAPM.beta(Ra, Rb, Rf = 0)

CAPM.beta.bull(Ra, Rb, Rf = 0)

CAPM.beta.bear(Ra, Rb, Rf = 0)

TimingRatio(Ra, Rb, Rf = 0)
}
\arguments{
\item{Ra}{an xts, vector, matrix, data frame, timeSeries or zoo object of
asset returns}

\item{Rb}{return vector of the benchmark asset}

\item{Rf}{risk free rate, in same period as your returns}
}
\description{
The single factor model or CAPM Beta is the beta of an asset to the variance 
and covariance of an initial portfolio.  Used to determine diversification potential.
}
\details{
This function uses a linear intercept model to achieve the same results as
the symbolic model used by \code{\link{BetaCoVariance}}

\deqn{\beta_{a,b}=\frac{CoV_{a,b}}{\sigma_{b}}=\frac{\sum((R_{a}-\bar{R_{a}})(R_{b}-\bar{R_{b}}))}{\sum(R_{b}-\bar{R_{b}})^{2}}}{beta
= cov(Ra,Rb)/var(R)}

Ruppert(2004) reports that this equation will give the estimated slope of
the linear regression of \eqn{R_{a}}{Ra} on \eqn{R_{b}}{Rb} and that this
slope can be used to determine the risk premium or excess expected return
(see Eq. 7.9 and 7.10, p. 230-231).

Two other functions apply the same notion of best fit to positive and
negative market returns, separately.  The \code{CAPM.beta.bull} is a
regression for only positive market returns, which can be used to understand
the behavior of the asset or portfolio in positive or 'bull' markets.
Alternatively, \code{CAPM.beta.bear} provides the calculation on negative
market returns.

The \code{TimingRatio} may help assess whether the manager is a good timer
of asset allocation decisions.  The ratio, which is calculated as
\deqn{TimingRatio =\frac{\beta^{+}}{\beta^{-}}}{Timing Ratio = beta+/beta-}
is best when greater than one in a rising market and less than one in a
falling market.

While the classical CAPM has been almost completely discredited by the 
literature, it is an example of a simple single factor model, 
comparing an asset to any arbitrary benchmark.
}
\examples{

data(managers)
    CAPM.alpha(managers[,1,drop=FALSE], 
			managers[,8,drop=FALSE], 
			Rf=.035/12) 
    CAPM.alpha(managers[,1,drop=FALSE], 
			managers[,8,drop=FALSE], 
			Rf = managers[,10,drop=FALSE])
    CAPM.alpha(managers[,1:6], 
			managers[,8,drop=FALSE], 
			Rf=.035/12)
    CAPM.alpha(managers[,1:6], 
			managers[,8,drop=FALSE], 
			Rf = managers[,10,drop=FALSE])
    CAPM.alpha(managers[,1:6], 
			managers[,8:7,drop=FALSE], 
			Rf=.035/12) 
    CAPM.alpha(managers[,1:6], 
			managers[,8:7,drop=FALSE], 
			Rf = managers[,10,drop=FALSE])
    CAPM.beta(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    CAPM.beta.bull(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    CAPM.beta.bear(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    TimingRatio(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE])
    chart.Regression(managers[, "HAM2", drop=FALSE], 
			managers[, "SP500 TR", drop=FALSE], 
			Rf = managers[, "US 3m TR", drop=FALSE], 
			fit="conditional", 
			main="Conditional Beta")
  		
}
\references{
Sharpe, W.F. Capital Asset Prices: A theory of market
equilibrium under conditions of risk. \emph{Journal of finance}, vol 19,
1964, 425-442. \cr Ruppert, David. \emph{Statistics and Finance, an
Introduction}. Springer. 2004. \cr Bacon, Carl. \emph{Practical portfolio
performance measurement and attribution}. Wiley. 2004. \cr
}
\seealso{
\code{\link{BetaCoVariance}} \code{\link{CAPM.alpha}}
\code{\link{CAPM.utils}}
}
\author{
Peter Carl
}
