% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multisynth_class.R
\name{dim.multisynth}
\alias{dim.multisynth}
\alias{n_unit.multisynth}
\alias{n_time.multisynth}
\alias{n_treated.multisynth}
\title{Number of units in multisynth}
\usage{
\method{dim}{multisynth}(x, ...)

\method{n_unit}{multisynth}(x, ...)

\method{n_time}{multisynth}(x, ...)

\method{n_treated}{multisynth}(x, ...)
}
\value{
dim: Dimension of data as pair of (# units, # time points).

Single number (of unique units).

Single number (of unique time points).

Number of treated units (always 1 for multisynth)
}
\description{
Number of units in multisynth

Number of time points in multisynth
}
