% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write.pts.r
\name{write.pts}
\alias{write.pts}
\title{exports a matrix containing landmarks into .pts format}
\usage{
write.pts(x, filename = dataname, rownames = NULL, NA.string = 9999)
}
\arguments{
\item{x}{k x m matrix containing landmark configuration}

\item{filename}{character: Path/name of the requested output - extension
will be added atuomatically. If not specified, the file will be named as the
exported object.}

\item{rownames}{provide an optional character vector with rownames}

\item{NA.string}{specify the string to use for encoding missing values}
}
\description{
exports a matrix containing landmarks into .pts format that can be read by
IDAV Landmark.
}
\details{
you can import the information into the program landmarks available at
http://graphics.idav.ucdavis.edu/research/EvoMorph
}
\examples{

data(nose)
write.pts(shortnose.lm, filename="shortnose")

}
\seealso{
\code{\link{read.pts}}
}
\author{
Stefan Schlager
}
