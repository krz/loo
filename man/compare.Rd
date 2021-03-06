% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare.R
\name{compare}
\alias{compare}
\title{Model comparison}
\usage{
compare(...)
}
\arguments{
\item{...}{At least two objects returned by \code{\link{loo}} or
\code{\link{waic}}.}
}
\value{
A vector or matrix with class \code{'compare.loo'}. If \code{...}
  contains more than two objects then a matrix of summary information is
  returned. If \code{...} contains exactly two objects then the difference in
  expected predictive accuracy and the standard error of the difference are
  returned (see Details). The difference will be positive if the expected
  predictive accuracy for the second model is higher.
}
\description{
Compare fitted models on LOO or WAIC
}
\details{
When comparing two fitted models, we can estimate the difference in
  their expected predictive accuracy by the difference in \code{elpd_waic} or
  \code{elpd_loo} (multiplied by \eqn{-2}, if desired, to be on the deviance
  scale). To compute the standard error of this difference we can use a
  paired estimate to take advantage of the fact that the same set of \eqn{N}
  data points was used to fit both models. We think these calculations will
  be most useful when \eqn{N} is large, because then non-normality of the
  distribution is not such an issue when estimating the uncertainty in these
  sums. These standard errors, for all their flaws, should give a better
  sense of uncertainty than what is obtained using the current standard
  approach of comparing differences of deviances to a Chi-squared
  distribution, a practice derived for Gaussian linear models or
  asymptotically, and which only applies to nested models in any case.
}
\note{
In previous versions of \pkg{loo} model weights were also reported by
  \code{compare}. We have removed the weights because they were based only on
  the point estimate of the elpd values ignoring the uncertainty. We are
  currently working on something similar to these weights that also accounts
  for uncertainty, which will be included in future versions of \pkg{loo}.
}
\examples{
\dontrun{
loo1 <- loo(log_lik1)
loo2 <- loo(log_lik2)
print(compare(loo1, loo2), digits = 3)

waic1 <- waic(log_lik1)
waic2 <- waic(log_lik2)
compare(waic1, waic2)
}

}
\references{
Vehtari, A., Gelman, A., and Gabry, J. (2016). Practical Bayesian model
evaluation using leave-one-out cross-validation and WAIC.
\url{http://arxiv.org/abs/1507.04544/} (preprint)
}
\seealso{
\code{\link{print.compare.loo}}
}

