#' Buffer GIS tools
#'
#' \code{sig_buffer} devuelve la zona de influencia entorno a las geometrias de un shapefile
#'
#' @param capa_entrada un objeto de tipo vectorial de la clase sf
#' @param distancia Distancia de vecindad para determinar la zona de influencia en m
#' @param dissolve Parámetro para controlar la fusión de geometrias.
#' @param campo Parámetro para fusionar por un atributo. Opcional.
#'
#' @return Un objeto vectorial de la case sfc_POLYGON
#'
#'
#'@import sf
#'@import dplyr
#'@export
#'
#' @examples
#' \dontrun{
#' ciudades_data <- data.frame(
#'nombre =c("Madrid", "Barcelona", "Sevilla"),
#'poblacion = c(3, 2, 5),
#'lon=c(3, 2, 5),
#'lat=c(5, 3, 2)
#')
#'ciudades_sf <- st_as_sf(ciudades_data, coords = c("lon","lat"), crs =4326)
#'
#'sig_buffer(ciudades_sf,distancia=200)
#'sig_buffer(ciudades_sf, distancia=200, dissolve = TRUE)
#'sig_buffer(ciudades_sf, distancia=200, dissolve = FALSE)}



sig_buffer <- function(capa_entrada,distancia, dissolve = TRUE, campo = NULL){

  if(dissolve==TRUE){
    buffer <-st_buffer(capa_entrada, dist= distancia) |>
      summarise(geometry = st_union(geometry))

  if(is.null(campo)){
    buffer <- st_buffer(capa_entrada, dist = distancia)|>
      group_by({{campo}}) |>
      summarise(geometry = st_union(geometry))
  }


  }else{
    buffer <- st_buffer(capa_entrada, dist= distancia)
  }

  return(buffer)
}

