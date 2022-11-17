## NOTAS para mapa de Acebedo con toponimos#
##test 27 10 2022
##---------------------------------------
# paquetes 
library(ggmap)
library(tidyverse)
library(sf)
library(ggspatial)
library(tmaptools)
library(leaflet)## 
library(sf)
library(readxl)

#Test Acebedo------------------------------------
##

##Posicion marcadores
 
# Leer datos de excel (en este caso exportado de google earth)
#my_data <- read_excel("locations.xlsx")


#prados <- data.frame(lon = my_data$x, 
  #                   lat = my_data$y, 
   #                  nombre = my_data$Name, 
    #                 tipo = my_data$tipo)

#points_sf <- st_as_sf(prados, coords = c("lon", "lat"), crs = 4326)


#1
my_prados <- read_excel("locations_prados.xlsx")
prados <- data.frame(lon = my_prados$x, 
                     lat = my_prados$y, 
                     nombre = my_prados$Name, 
                     tipo = my_prados$tipo)

prados_sf <- st_as_sf(prados, coords = c("lon", "lat"), crs = 4326)

#2
my_cima <- read_excel("locations_cima.xlsx")
cimas <- data.frame(lon = my_cima$x, 
                     lat = my_cima$y, 
                     nombre = my_cima$Name, 
                     tipo = my_cima$tipo)

cimas_sf <- st_as_sf(cimas, coords = c("lon", "lat"), crs = 4326)
 
#3
my_valle <- read_excel("locations_valle.xlsx")
valles <- data.frame(lon = my_valle$x, 
                    lat = my_valle$y, 
                    nombre = my_valle$Name, 
                    tipo = my_valle$tipo)

valles_sf <- st_as_sf(valles, coords = c("lon", "lat"), crs = 4326)

#4
my_fuente <- read_excel("locations_fuente.xlsx")
fuentes <- data.frame(lon = my_fuente$x, 
                    lat = my_fuente$y, 
                    nombre = my_fuente$Name, 
                    tipo = my_fuente$tipo)

fuentes_sf <- st_as_sf(fuentes, coords = c("lon", "lat"), crs = 4326)

#5
my_puente <- read_excel("locations_puente.xlsx")
puentes <- data.frame(lon = my_puente$x, 
                      lat = my_puente$y, 
                      nombre = my_puente$Name, 
                      tipo = my_puente$tipo)

puentes_sf <- st_as_sf(puentes, coords = c("lon", "lat"), crs = 4326)

#6
my_tumulo <- read_excel("locations_tumulo.xlsx")
tumulo <- data.frame(lon = my_tumulo$x, 
                    lat = my_tumulo$y, 
                    nombre = my_tumulo$Name, 
                    tipo = my_tumulo$tipo)

tumulo_sf <- st_as_sf(tumulo, coords = c("lon", "lat"), crs = 4326)

#7
my_otros <- read_excel("locations_otros.xlsx")
otros <- data.frame(lon = my_otros$x, 
                    lat = my_otros$y, 
                    nombre = my_otros$Name, 
                    tipo = my_otros$tipo)

otros_sf <- st_as_sf(otros, coords = c("lon", "lat"), crs = 4326)


# mapa
n <- leaflet() %>%
  setView(lng=-5.116429, lat=43.04103, zoom=14) %>%
  addTiles()  %>%
  
  addLabelOnlyMarkers(data = prados_sf,
                      label = as.character(prados$nombre),
                      group = "Prados",
                      labelOptions = leaflet::labelOptions(
                      style=list('color'="#000000",
                                   'fontSize'="15px", 
                                   'font-family'= 'serif',
                                   'background-color' = "rgba(255,255,255,0.5)",
                                   "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                   "border-color" = "rgba(255,255,255,0.5)"),
                      noHide = TRUE,
                      direction = "bottom",
                      textOnly = TRUE,
                      offset = c(0, -10),
                      opacity = 1),
                      clusterOptions = markerClusterOptions(
                                       showCoverageOnHover = TRUE,
                                       zoomToBoundsOnClick = TRUE,
                                       spiderfyOnMaxZoom = TRUE,
                                       removeOutsideVisibleBounds = TRUE,
                                       spiderLegPolylineOptions = list(
                                                                   weight = 1.5,
                                                                 color = "#222",
                                                                opacity = 0.1),
                                       freezeAtZoom = FALSE,
                                       maxClusterRadius = 40)) %>%

addLabelOnlyMarkers(data = cimas_sf,
                    label = as.character(cimas$nombre),
                    group = "Cimas",
                    labelOptions = leaflet::labelOptions(
                      style=list('color'="#000000",
                                 'fontSize'="15px", 
                                 'font-family'= 'serif',
                                 'background-color' = "rgba(255,255,255,0.5)",
                                 "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                 "border-color" = "rgba(255,255,255,0.5)"),
                      noHide = TRUE,
                      direction = "bottom",
                      textOnly = TRUE,
                      offset = c(0, -10),
                      opacity = 1),
                    clusterOptions = markerClusterOptions(
                      showCoverageOnHover = TRUE,
                      zoomToBoundsOnClick = TRUE,
                      spiderfyOnMaxZoom = TRUE,
                      removeOutsideVisibleBounds = TRUE,
                      spiderLegPolylineOptions = list(
                        weight = 1.5,
                        color = "#222",
                        opacity = 0.1),
                      freezeAtZoom = FALSE,
                      maxClusterRadius = 40)) %>%

 
  addLabelOnlyMarkers(data = fuentes_sf,
                      label = as.character(fuentes$nombre),
                      group = "Fuentes",
                      labelOptions = leaflet::labelOptions(
                        style=list('color'="#000000",
                                   'fontSize'="15px", 
                                   'font-family'= 'serif',
                                   'background-color' = "rgba(255,255,255,0.5)",
                                   "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                   "border-color" = "rgba(255,255,255,0.5)"),
                        noHide = TRUE,
                        direction = "bottom",
                        textOnly = TRUE,
                        offset = c(0, -10),
                        opacity = 1),
                      clusterOptions = markerClusterOptions(
                        showCoverageOnHover = TRUE,
                        zoomToBoundsOnClick = TRUE,
                        spiderfyOnMaxZoom = TRUE,
                        removeOutsideVisibleBounds = TRUE,
                        spiderLegPolylineOptions = list(
                          weight = 1.5,
                          color = "#222",
                          opacity = 0.1),
                        freezeAtZoom = FALSE,
                        maxClusterRadius = 40)) %>%
  
  addLabelOnlyMarkers(data = puentes_sf,
                      label = as.character(puentes$nombre),
                      group = "Puentes",
                      labelOptions = leaflet::labelOptions(
                        style=list('color'="#000000",
                                   'fontSize'="15px", 
                                   'font-family'= 'serif',
                                   'background-color' = "rgba(255,255,255,0.5)",
                                   "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                   "border-color" = "rgba(255,255,255,0.5)"),
                        noHide = TRUE,
                        direction = "bottom",
                        textOnly = TRUE,
                        offset = c(0, -10),
                        opacity = 1),
                      clusterOptions = markerClusterOptions(
                        showCoverageOnHover = TRUE,
                        zoomToBoundsOnClick = TRUE,
                        spiderfyOnMaxZoom = TRUE,
                        removeOutsideVisibleBounds = TRUE,
                        spiderLegPolylineOptions = list(
                          weight = 1.5,
                          color = "#222",
                          opacity = 0.1),
                        freezeAtZoom = FALSE,
                        maxClusterRadius = 40)) %>%
  
  addLabelOnlyMarkers(data = valles_sf,
                      label = as.character(valles$nombre),
                      group = "Valles",
                      labelOptions = leaflet::labelOptions(
                        style=list('color'="#000000",
                                   'fontSize'="15px", 
                                   'font-family'= 'serif',
                                   'background-color' = "rgba(255,255,255,0.5)",
                                   "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                   "border-color" = "rgba(255,255,255,0.5)"),
                        noHide = TRUE,
                        direction = "bottom",
                        textOnly = TRUE,
                        offset = c(0, -10),
                        opacity = 1),
                      clusterOptions = markerClusterOptions(
                        showCoverageOnHover = TRUE,
                        zoomToBoundsOnClick = TRUE,
                        spiderfyOnMaxZoom = TRUE,
                        removeOutsideVisibleBounds = TRUE,
                        spiderLegPolylineOptions = list(
                          weight = 1.5,
                          color = "#222",
                          opacity = 0.1),
                        freezeAtZoom = FALSE,
                        maxClusterRadius = 40)) %>%
  
  addLabelOnlyMarkers(data = tumulo_sf,
                      label = as.character(tumulo$nombre),
                      group = "Túmulos",
                      labelOptions = leaflet::labelOptions(
                        style=list('color'="#000000",
                                   'fontSize'="15px", 
                                   'font-family'= 'serif',
                                   'background-color' = "rgba(255,255,255,0.5)",
                                   "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                   "border-color" = "rgba(255,255,255,0.5)"),
                        noHide = TRUE,
                        direction = "bottom",
                        textOnly = TRUE,
                        offset = c(0, -10),
                        opacity = 1),
                      clusterOptions = markerClusterOptions(
                        showCoverageOnHover = TRUE,
                        zoomToBoundsOnClick = TRUE,
                        spiderfyOnMaxZoom = TRUE,
                        removeOutsideVisibleBounds = TRUE,
                        spiderLegPolylineOptions = list(
                          weight = 1.5,
                          color = "#222",
                          opacity = 0.1),
                        freezeAtZoom = FALSE,
                        maxClusterRadius = 40)) %>%
  
  addLabelOnlyMarkers(data = otros_sf,
                      label = as.character(otros$nombre),
                      group = "Otros",
                      labelOptions = leaflet::labelOptions(
                        style=list('color'="#000000",
                                   'fontSize'="15px", 
                                   'font-family'= 'serif',
                                   'background-color' = "rgba(255,255,255,0.5)",
                                   "box-shadow" = "2px 2px rgba(0,0,0,0.2)",
                                   "border-color" = "rgba(255,255,255,0.5)"),
                        noHide = TRUE,
                        direction = "bottom",
                        textOnly = TRUE,
                        offset = c(0, -10),
                        opacity = 1),
                      clusterOptions = markerClusterOptions(
                        showCoverageOnHover = TRUE,
                        zoomToBoundsOnClick = TRUE,
                        spiderfyOnMaxZoom = TRUE,
                        removeOutsideVisibleBounds = TRUE,
                        spiderLegPolylineOptions = list(
                          weight = 1.5,
                          color = "#222",
                          opacity = 0.1),
                        freezeAtZoom = FALSE,
                        maxClusterRadius = 40)) 
  
  

n %>% 
  addProviderTiles("OpenTopoMap", group = "Topo") %>%
  addProviderTiles("Esri.WorldImagery", group = "Satelite") %>%
  addLayersControl( baseGroups = c("Satelite", "Topo", "OSM"),
                    overlayGroups = c("Prados", "Cimas",  "Fuentes", 
                                      "Puentes", "Valles", "Túmulos", 
                                      "Otros"),
                    options = layersControlOptions(collapsed = FALSE)
  )






