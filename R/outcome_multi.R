################################################################################
## Fitting outcome models for multiple treatment groups
################################################################################


#' Use gsynth to fit factor model with 
#'
#' @param X Matrix of outcomes
#' @param trt Vector of treatment status for each unit
#' @param mask Matrix of treatment statuses
#' @param r Number of factors to use (or start with if CV==1)
#' @param r.end Max number of factors to consider if CV==1
#' @param force=c(0,1,2,3) Fixed effects (0=none, 1=unit, 2=time, 3=two-way)
#' @param CV Whether to do CV (0=no CV, 1=yes CV)
#'
#' @return \itemize{
#'           \item{y0hat }{Predicted outcome under control}
#'           \item{params }{Regression parameters}}
fit_gsynth_multi <- function(X, trt, r=0, r.end=5, force=3, CV=1) {

    if(!requireNamespace("gsynth", quietly = TRUE)) {
        stop("In order to fit generalized synthetic controls, you must install the gsynth package.")
    }


    ttot <- ncol(X)
    n <- nrow(X)
    
    ## observed matrix (everything observed)
    I <- matrix(1, ttot, n)

    ## treatment matrix
    trt_mat <- matrix(0, nrow=n, ncol=ttot)
    trt_mat[is.finite(trt),] <-
        t(vapply(trt[is.finite(trt)],
               function(ti) c(rep(0, ti), rep(1, ttot-ti)),
               numeric(ttot)))

    ## use internal gsynth function
    capture.output(gsyn <- gsynth:::synth.core(t(X), NULL, t(trt_mat), I,
                                               r=r, r.end=r.end,
                                               force=force, CV=CV,
                                               tol=0.001))
    ## get predicted outcomes
    y0hat <- matrix(0, nrow=n, ncol=ttot)
    y0hat[!is.finite(trt),]  <- t(gsyn$Y.co - gsyn$est.co$residuals)

    y0hat[is.finite(trt),] <- t(gsyn$Y.ct)

    ## add treated prediction for whole pre-period
    gsyn$est.co$Y.ct <- gsyn$Y.ct
    
    return(list(y0hat=y0hat,
                params=gsyn$est.co))
    
}
