% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/psislw.R
\name{psislw}
\alias{psislw}
\title{Pareto smoothed importance sampling (PSIS)}
\usage{
psislw(lw, wcp = 0.2, wtrunc = 3/4, cores = getOption("loo.cores",
  parallel::detectCores()), llfun = NULL, llargs = NULL, ...)
}
\arguments{
\item{lw}{A matrix or vector of log weights. For computing LOO, \code{lw =
-log_lik} (see \code{\link{extract_log_lik}}) and is an \eqn{S} by \eqn{N}
matrix where \eqn{S} is the number of simulations and \eqn{N} is the number
of data points. (If \code{lw} is a vector it will be coerced to a
one-column matrix.)}

\item{wcp}{The proportion of importance weights to use for the generalized
Pareto fit. The \code{100*wcp}\% largest weights are used as the sample
from which to estimate the parameters of the generalized Pareto
distribution.}

\item{wtrunc}{For truncating very large weights to \eqn{S}^\code{wtrunc}. Set
to zero for no truncation.}

\item{cores}{The number of cores to use for parallelization. This can be set
for an entire R session by \code{options(loo.cores = NUMBER)}. The default
is \code{\link[parallel]{detectCores}}().}

\item{llfun, llargs}{See \code{\link{loo.function}}.}

\item{...}{Ignored when \code{psislw} is called directly. The \code{...} is
only used internally when \code{psislw} is called by the \code{\link{loo}}
function.}
}
\value{
A named list with components \code{lw_smooth} (modified log weights)
  and \code{pareto_k} (estimated generalized Pareto shape parameter(s)
  \eqn{k}).
}
\description{
Pareto smoothed importance sampling (PSIS)
}
\details{
See the 'PSIS-LOO' section in \code{\link{loo-package}}.
}
\note{
This function is primarily intended for internal use, but is exported
  so that users can call it directly if interested in PSIS for purposes other
  than \code{\link[=loo]{LOO-CV}}.
}
\references{
Vehtari, A., Gelman, A., and Gabry, J. (2016). Practical Bayesian model
evaluation using leave-one-out cross-validation and WAIC.
\url{http://arxiv.org/abs/1507.04544/} (preprint)
}

