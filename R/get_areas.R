#' @title Get city administrative districs
#' 
#' @description Downloads maps of city administrative districts.
#'
#' @param city The desired city. Options are Helsinki, Espoo, 
#' Vantaa, Turku, Tampere, Oulu
#' @param level The desired administrative level. Options are 1, 2 and 3,
#' where 1 is the lowest level (= largest areas) and 3 is the highest level 
#' (= smallest areas)
#' @param draw Draw the map immediately? Default is FALSE
#' 
#' @import ggplot2
#' @importFrom httr parse_url build_url
#' @importFrom sf st_read read_sf
#' 
#' @usage 
#' get_areas(city = "turku", level = 1, draw = FALSE)
#' 
#' @return sf object
#' @export

get_areas <- function(city="turku", level=1, draw = FALSE) {
  
  if (!(city %in% c("turku", "helsinki", "espoo", "vantaa", "tampere", "oulu"))) {
    stop("invalid city input")
  }
  
  if (!(level %in% c(1,2,3))) {
    stop("invalid level input")
  }
  
  if (city == "turku") {
    if (level == 1) {
      url_geo <- "http://dev.turku.fi/datasets/aluejaot/suuralueet-4326.geojson"
      object <- sf::st_read(dsn = url_geo)
    }
    if (level == 2) {
      url_geo <- "http://dev.turku.fi/datasets/aluejaot/kaupunginosat-4326.geojson"
      object <- sf::st_read(dsn = url_geo)
    }
    if (level == 3) {
      url_geo <- "http://dev.turku.fi/datasets/aluejaot/pienalueet-4326.geojson"
      object <- sf::st_read(dsn = url_geo)
    }
  }
  
  if (city %in% c("helsinki", "vantaa", "espoo")) {
    
    wfs_hel <- "https://kartta.hel.fi/ws/geoserver/avoindata/wfs"
    url <- httr::parse_url(wfs_hel)
    
    if (level == 1) {
      
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "avoindata:Seutukartta_aluejako_suuralue",
                        srsName = "EPSG:3879",
                        outputFormat = "GML2")
    }
    if (level == 2) {
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "avoindata:Seutukartta_aluejako_tilastoalue",
                        srsName = "EPSG:3879",
                        outputFormat = "GML2")
    }
    if (level == 3) {
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "avoindata:Seutukartta_aluejako_pienalue",
                        srsName = "EPSG:3879",
                        outputFormat = "GML2")
    }
      
      request <- httr::build_url(url)
      pk_regions <- sf::read_sf(request)
      
      if (city == "helsinki") {
        object <- pk_regions[which(pk_regions$kunta == "091"),]
      }
      
      if (city == "vantaa") {
        object <- pk_regions[which(pk_regions$kunta == "092"),]
      }
      
      if (city == "espoo") {
        object <- pk_regions[which(pk_regions$kunta == "049"),]
      }
  }
  
  if (city == "tampere") {
    wfs_tam <- "https://geodata.tampere.fi/geoserver/ows"
    url <- httr::parse_url(wfs_tam)
    
    if (level == 1) {
      
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "hallinnolliset_yksikot:KH_SUURALUE",
                        srsName = "EPSG:3878",
                        outputFormat = "GML2")
    }
    if (level == 2) {
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "hallinnolliset_yksikot:KH_SUUNNITTELUALUE",
                        srsName = "EPSG:3878",
                        outputFormat = "GML2")
    }
    if (level == 3) {
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "hallinnolliset_yksikot:KH_TILASTO",
                        srsName = "EPSG:3878",
                        outputFormat = "GML2")
    }
    
    request <- httr::build_url(url)
    tampere_regions <- sf::read_sf(request)
    object <- tampere_regions
  }
  
  if (city == "oulu") {
    wfs_oulu <- "https://e-kartta.ouka.fi/TeklaOGCWeb/WFS.ashx"
    url <- httr::parse_url(wfs_oulu)
    
    if (level == 1) {
      
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "gis:Suuralueet",
                        srsName = "EPSG:3067",
                        outputFormat = "GML2")
    }
    if (level == 2) {
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "gis:Kaupunginosat",
                        srsName = "EPSG:3067",
                        outputFormat = "GML2")
    }
    if (level == 3) {
      url$query <- list(service = "wfs",
                        version = "1.1.0",
                        request = "GetFeature",
                        typename = "gis:Aanestysalueet",
                        srsName = "EPSG:3067",
                        outputFormat = "GML2")
    }
    
    request <- httr::build_url(url)
    oulu_regions <- sf::read_sf(request)
    object <- oulu_regions
  }
  if (draw == TRUE){
    ggplot(object) + geom_sf()
  } else {
    object
  }
}
