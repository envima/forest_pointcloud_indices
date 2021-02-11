#' Main control script
#'
#' @description Use this script for controlling the processing.
#'
#' @author [Marvin]
#'

library(envimaR)
if (Sys.info()[["nodename"]] == "marvinpc") {
  root_folder = "/home/marvin/casestudies/forest_pointcloud_indices/"
}
setwd(root_folder)
source("src/functions/000_setup.R")



# specify sample area
e = c(477740, 477940, 5632160, 5632360)

# preprocessing ----
# normalize level0 pointclouds and save to level1

outpath = "data/level1/normalized_pointclouds"
dir.create(outpath)

list.files("data/level0/pointclouds/", full.names = TRUE) %>%
  map(function(f){
    pc = readLAS(f)
    pc = normalizePC(pc)
    writeLAS(pc, file.path(outpath, basename(f)))
  })


# calculate indices ----
# create grids and calculate indices, save in results

res = c(1,2,4,5,8,10)
source("src/020_calculate_indices.R")


# calculate heterogenity ----
# use 1m indices as basis for 10m heterogenity
source("src/030_calculate_heterogenity.R")

