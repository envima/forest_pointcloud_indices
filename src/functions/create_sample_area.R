#' Create Sample Area
#' @description Use the Sentinel-2 basegrid to create sample areas with various resolutions
#'
#' @param sample_extent extent, xmin xmax ymin ymax
#' @param resolution integer, target resolution of sample area
#' @param basegrid string, path to Sentinel-2 basegrid
#'
#' @return rasterLayer, sample area
#'
#' @author Marvin Ludwig
#'
#' @export

#

createSampleArea = function(sample_extent, resolution = 10, basegrid = "data/imports/mof_grid_10m.tif"){

  mof_grid = raster::raster(basegrid)
  sample_grid = raster::crop(mof_grid, sample_extent)
  sample_grid = raster::disaggregate(sample_grid, 10)


  sample_grid = raster::aggregate(sample_grid, resolution)
  sample_grid = setValues(sample_grid, seq(ncell(sample_grid)))
  return(sample_grid)
}






