#' Normalized Difference tool
#'
#' \code{ndiff} calcula el indice de diferencia normalizada
#'
#' @param x un objeto con valores numericos
#' @param y un objeto con valores numericos de la misma clase que x
#'
#' @return Uvalores numericos del indice
#'
#' @examples
#'ndiff(0.8,0.05)
#'ndiff(c(0.3,0.9),c(0.7,0.4))
#'
#'@export

ndiff <- function(x, y){
  (x-y)/(x+y)
}


