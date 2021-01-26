#' Main control script
#'
#' @description Use this script for controlling the processing.
#'
#' @author [name], [email@com]
#'

library(envimaR)
if (Sys.info()[["nodename"]] == "marvinpc") {
  root_folder = "/home/marvin/casestudies/forest_pointcloud_indices/"
}
source("src/functions/000_setup.R")

# specify sample area
e = c(477740, 477940, 5632160, 5632360)

source(paste0(envrmt$src, "/001_create_sample_area.R"))




