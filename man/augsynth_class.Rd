% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/augsynth_class.R
\name{is.augsynth}
\alias{is.augsynth}
\alias{dim.augsynth}
\alias{n_unit.augsynth}
\alias{n_time.augsynth}
\alias{n_treated.augsynth}
\title{Methods for accessing details of augsynth result object (of class augsynth)}
\usage{
is.augsynth(x)

\method{dim}{augsynth}(x, ...)

\method{n_unit}{augsynth}(x, ...)

\method{n_time}{augsynth}(x, ...)

\method{n_treated}{augsynth}(x, ...)
}
\arguments{
\item{x}{augsynth result object}
}
\value{
is.augsynth: TRUE if object is a augsynth object.

dim: Dimension of data as pair of (# units, # time points).

Single number (of unique units).

Single number (of unique time points).

Number of treated units (always 1 for augsynth)
}
\description{
Methods for accessing details of augsynth result object (of class augsynth)

Number of time points in augsynth
}
