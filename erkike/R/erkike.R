#Crear una version de la herramienta buffer

#la herramiente depende de los siguientes paquetes
library(sf)
library(dplyr)


#toma una capa vectorial de entrada
#requiere de especificar una distancia de vecindad
#Opciones:
#    - fusionar o no geometrías
#    - fusionar en función de atributo
#    - mantener atributos en la capa resultante

parcelas <- read_sf("c:/Users/AlumnoMaster/Desktop/Nueva carpeta/programacion/otro/R/parcelas.shp") |>
  mutate(Especie = 1)


parcelas_buffer <- st_buffer(parcelas, dist= 10000) |>
  #group_by(Especie) |>
  summarise(geometry = st_union(geometry))
plot(parcelas_buffer)

sig_buffer <- function(capa_entrada,distancia, dissolve = TRUE){

  if(dissolve==TRUE){
    buffer <-st_buffer(capa_entrada, dist= distancia) |>
      summarise(geometry = st_union(geometry))
  }else{
    buffer <- st_buffer(capa_entrada, dist= distancia)
  }

  return(buffer)
}

parcelas_buffer_funcion <- sig_buffer(parcelas, 7000)
plot(parcelas_buffer_funcion)

parcelas_buffer_funcion_false <- sig_buffer(parcelas, 7000, dissolve = FALSE)
plot(parcelas_buffer_funcion_false)

