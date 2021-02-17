#' @title Visualize data
#' 
#' @description Visualize local level data on a choropleth map.
#'
#' @param city The desired city. Options are Helsinki, Espoo, 
#' Vantaa, Turku, Tampere, Oulu
#' @param level The desired administrative level. Options are 1, 2 and 3,
#' where 1 is the lowest level (= largest areas) and 3 is the highest level 
#' (= smallest areas)
#' @param dataset a dataset containing suitable data
#' 
#' @usage 
#' visualize_data(city = "turku", level = 3, dataset = NULL)
#' 
#' @example 
#' Not run: 
#' visualize_data(city = "turku", level = 3, dataset = turku_vaesto_ika_2010_2019)
#' End(Not run)
#' 
#' @import sf
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @importFrom utils data select.list 
#' @importFrom janitor clean_names
#' 
#' @return sf object
#' @export

visualize_data <- function(city="turku", level = 3, dataset = NULL) {
  
  if (city != "turku") {
    stop("Only Turku supported at this time! Use get_data(\"turku\")")
  }
  
  if (is.null(dataset)) {
    stop("input valid data, see data(package=\"cityhoods\") for options")
  }
  
  viz_area <- get_areas(city = city, level = level, draw = FALSE)
  viz_data <- janitor::clean_names(dataset)
  
  # Extremely hacky solution to choosing and filtering rows
  filter_value <- NULL
  filter_value1 <- select.list(choices = unique(viz_data$vuosi), 
                               title = names(viz_data$Vuosi), 
                               multiple = FALSE, 
                               graphics = FALSE)
  filter_value2 <- select.list(choices = unique(viz_data$ika), 
                               title = names(viz_data$ika), 
                               multiple = FALSE, 
                               graphics = FALSE)
  
  viz_data <- filter(viz_data, viz_data$vuosi == filter_value1 & viz_data$ika == filter_value2)
  
  area_and_data <- dplyr::left_join(viz_area, viz_data, by = c("id" = "osa_alue"))
  
  ggplot(area_and_data) + geom_sf(aes(fill=area_and_data$value))
  
}
