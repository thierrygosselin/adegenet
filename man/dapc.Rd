\encoding{UTF-8}
\name{dapc}
\alias{dapc}
\alias{dapc.data.frame}
\alias{dapc.matrix}
\alias{dapc.genind}
\alias{dapc.dudi}
\alias{dapc.genlight}
\alias{print.dapc}
\alias{summary.dapc}
\alias{predict.dapc}
\alias{as.lda}
\alias{as.lda.dapc}
\title{Discriminant Analysis of Principal Components (DAPC)}
\description{
  These functions implement the Discriminant Analysis of Principal
  Components (DAPC, Jombart et al. 2010). This method descibes the
  diversity between pre-defined groups. When groups are unknown, use
  \code{find.clusters} to infer genetic clusters. See 'details' section
  for a succint description of the method, and
  \code{vignette("adegenet-dapc")} for a tutorial. Graphical methods for
  DAPC are documented in \code{\link{scatter.dapc}} (see
  \code{?scatter.dapc}).
 \code{dapc} is a generic function performing the DAPC on the following
 types of objects:\cr
 - \code{data.frame} (only numeric data)\cr
 - \code{matrix} (only numeric data)\cr
 - \code{\linkS4class{genind}} objects (genetic markers)\cr
 - \code{\linkS4class{genlight}} objects (genome-wide SNPs)
 These methods all return an object with class \code{dapc}.
 Functions that can be applied to these objects are (the ".dapc" can be
 ommitted):
  - \code{print.dapc}: prints the content of a \code{dapc} object.\cr
  - \code{summary.dapc}: extracts useful information from a \code{dapc}
  object.\cr
  - \code{predict.dapc}: predicts group memberships based on DAPC results.\cr
  - \code{xvalDapc}: performs cross-validation of DAPC using varying
  numbers of PCs (and keeping the number of discriminant functions
  fixed); it currently has methods for \code{data.frame} and \code{matrix}.\cr
  DAPC implementation calls upon \code{\link[ade4]{dudi.pca}} from the
  \code{ade4} package (except for \linkS4class{genlight} objects)
  and \code{\link[MASS]{lda}} from the \code{MASS} package. The
  \code{predict} procedure uses \code{\link[MASS]{predict.lda}} from the
  \code{MASS} package.
  \code{as.lda} is a generic with a method for \code{dapc} object which
  converts these objects into outputs similar to that of
  \code{lda.default}.
}
\usage{
\method{dapc}{data.frame}(x, grp, n.pca=NULL, n.da=NULL, center=TRUE,
     scale=FALSE, var.contrib=TRUE, var.loadings=FALSE, pca.info=TRUE,
     pca.select=c("nbEig","percVar"), perc.pca=NULL, \ldots, dudi=NULL)
\method{dapc}{matrix}(x, \ldots)
\method{dapc}{genind}(x, pop=NULL, n.pca=NULL, n.da=NULL, scale=FALSE,
     truenames=TRUE, var.contrib=TRUE, var.loadings=FALSE, pca.info=TRUE,
     pca.select=c("nbEig","percVar"), perc.pca=NULL, \ldots)
\method{dapc}{genlight}(x, pop=NULL, n.pca=NULL, n.da=NULL,
   scale=FALSE, var.contrib=TRUE, var.loadings=FALSE, pca.info=TRUE,
   pca.select=c("nbEig", "percVar"), perc.pca=NULL, glPca=NULL, \ldots)
\method{dapc}{dudi}(x, grp, \ldots)
\method{print}{dapc}(x, \dots)
\method{summary}{dapc}(object, \dots)
\method{predict}{dapc}(object, newdata, prior = object$prior, dimen,
         method = c("plug-in", "predictive", "debiased"), ...)
}
\arguments{
  \item{x}{\code{a data.frame}, \code{matrix}, or \code{\linkS4class{genind}}
    object. For the \code{data.frame} and \code{matrix} arguments, only
    quantitative variables should be provided.}
  \item{grp,pop}{a \code{factor} indicating the group membership of
    individuals; for \code{scatter}, an optional grouping of individuals.}
  \item{n.pca}{an \code{integer} indicating the number of axes retained in the
    Principal Component Analysis (PCA) step. If \code{NULL}, interactive selection is triggered.}
  \item{n.da}{an \code{integer} indicating the number of axes retained in the
    Discriminant Analysis step. If \code{NULL}, interactive selection is triggered.}
  \item{center}{a \code{logical} indicating whether variables should be centred to
    mean 0 (TRUE, default) or not (FALSE). Always TRUE for \linkS4class{genind} objects.}
  \item{scale}{a \code{logical} indicating whether variables should be scaled
    (TRUE) or not (FALSE, default). Scaling consists in dividing variables by their
    (estimated) standard deviation to account for trivial differences in
    variances.}
