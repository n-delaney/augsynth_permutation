% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/donor_control.R
\name{donor_table}
\alias{donor_table}
\title{Return a summary data frame donor units used in the model with
their synthetic weights.}
\usage{
donor_table(augsynth, include_RMSPE = FALSE, zap_weights = 1e-07)
}
\arguments{
\item{augsynth}{Augsynth object to be plotted}

\item{include_RMSPE}{Include RMSPEs in the table even if
permutation inference has not yet been conducted.}

\item{zap_weights}{all weights smaller than this value will be set
to zero. Set to NULL to keep all weights.}
}
\description{
If permutation inference has been conducted, table will also
include RMSPEs.  This can be forced with include_RMSPE flag.
}
\details{
If the augsynth object does not have permutation-based inference
results, the function will call that form of inference, in order to
calculate the RMSPEs for each donor unit in turn.
}
