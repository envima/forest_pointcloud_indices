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

mof_dem = raster("data/imports/mof_dem_01m.tif")


list.files("data/level0/pointclouds/", full.names = TRUE) %>%
  map(function(f){
    pc = readLAS(f)
    pc = normalizePC(pc, dem = mof_dem)
    writeLAS(pc, file.path(outpath, basename(f)))
  })


# calculate indices ----
# create grids and calculate indices, save in results
# calculate bakx1 indices
list.files("data/level1/normalized_pointclouds/", full.names = TRUE) %>%
  map(function(x) calculateIndices(pc_file = x, indices = ~bakx1(z = Z, rn = ReturnNumber)))

# calculate chm voxel based indices

list.files("data/level1/normalized_pointclouds/", full.names = TRUE) %>%
  map(function(x) calculateIndices(pc_file = x, indices = ~zVoxel(z = Z)))

list.files("data/level1/normalized_pointclouds/", full.names = TRUE) %>%
  map(function(x) calculateIndices(pc_file = x, indices = ~nVoxel(z = Z)))



# calculate heterogenity ----
# use 1m indices as basis for 10m heterogenity
source("src/030_calculate_heterogenity.R")



# rerun run with combined pointclouds
if(FALSE) source("src/011_combine_pointclouds.R")

list.files("data/level1/combined_pointclouds/", full.names = TRUE) %>%
  map(function(x) calculateIndices(pc_file = x, indices = ~bakx1(z = Z, rn = ReturnNumber)))

list.files("data/level1/combined_pointclouds/", full.names = TRUE) %>%
  map(function(x) calculateIndices(pc_file = x, indices = ~zVoxel(z = Z)))

list.files("data/level1/combined_pointclouds/", full.names = TRUE) %>%
  map(function(x) calculateIndices(pc_file = x, indices = ~nVoxel(z = Z)))

source("src/030_calculate_heterogenity.R")
