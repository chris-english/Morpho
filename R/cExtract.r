#' extract information about fixed landmarks, curves and patches from and atlas
#' generated by "landmark"
#' 
#' After exporting the pts file of the atlas from "landmark" and importing it
#' into R via "read.pts" cExtract gets information which rows of the landmark
#' datasets belong to curves or patches.
#' 
#' 
#' @param pts.file either a character naming the path to a pts.file or the name
#' of an object imported via read.pts.
#' @return returns a list containing the vectors with the indices of matrix
#' rows belonging to the in "landmark" defined curves, patches and fix
#' landmarks and a matrix containing landmark coordinates.
#' @author Stefan Schlager
#' @seealso \code{\link{read.lmdta}} ,\code{\link{read.pts}}
#' @export
cExtract <- function(pts.file)
{
    if (is.character(pts.file))
        x <- read.pts(pts.file)
    else
	x <- pts.file	
    
    allnames <- row.names(x)
    cs <- grep("C",allnames)
    ps <- grep("P",allnames)
    S <- grep("S",allnames)
    if (length(ps) > 0)
        cs <- c(cs,ps)
    cnames <- row.names(x)[cs]	
    olevels <- levels(as.factor(substr(cnames,1,4)))
    S <- grep("S",allnames)
    if (length(S) == 0 ) {
        S <- NULL
    } else {
        S <- "S"
    }
    olevels <- c(S, olevels)
    tl <- length(olevels)
    
    out <- list()	
    for (i in 1:tl)
        out[[olevels[i]]] <- grep(olevels[i],allnames)

    out$coords <- x
    return(out)
}
