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
my_data <- read_excel("locations.xlsx")
prados <- data.frame(lon = my_data$x, 
                     lat = my_data$y, 
                     nombre = my_data$Name, 
                     tipo = my_data$tipo)

# data.frame a sf
points_sf <- st_as_sf(prados, coords = c("lon", "lat"), crs = 4326)

points.df <- split(points_sf, prados$tipo)
# 
# names(points.df) 



# quakes <- quakes %>%
#   dplyr::mutate(mag.level = cut(mag,c(3,4,5,6),
#                                 labels = c('>3 & <=4', '>4 & <=5', '>5 & <=6')))

# quakes.df <- split(quakes, quakes$mag.level)
# 
# l <- leaflet() %>% addTiles()
# 
# names(quakes.df) %>%
#   purrr::walk( function(df) {
#     l <<- l %>%
#       addMarkers(data=quakes.df[[df]],hhh
#                  lng=~long, lat=~lat,
#                  label=~as.character(mag),
#                  popup=~as.character(mag),
#                  group = df,
#                  clusterOptions = markerClusterOptions(removeOutsideVisibleBounds = F),
#                  labelOptions = labelOptions(noHide = F,
#                                              direction = 'auto'))
#   })



###

# mapa
n <- leaflet() %>%
  setView(lng=-5.116429, lat=43.04103, zoom=14) %>%
  addTiles()  %>%
  
  ## Anhadimos marcadores como nombres con cluster 
  addLabelOnlyMarkers(data = points_sf,
                      label = as.character(prados$nombre),
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
                      # group = df,
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
  addLayersControl(
    baseGroups = c("Satelite", "Topo", "OSM"),
    # overlayGroups = ,
    options = layersControlOptions(collapsed = TRUE)
  )





