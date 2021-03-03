#' Normalize pointclouds
#' @description filters confidence in denseclouds and uniform point density
#'
#' @param pc LAS object
#' @param confidence_limit integer, how many depth maps should a point appear in. Relevant for sfm pointclouds only
#' @param ppsqm integer, points per square meter
#' @param dem raster, (optional) a digital elevation model to normalize height
#'
#' @return LAS object, filtered pointcloud
#'
#' @author Marvin Ludwig
#'
#' @export

#



normalizePC = function(pc, confidence_limit = 2, ppsqm = 50, dem = NULL){
  if("confidence" %in% colnames(pc@data)){
    pc = filter_poi(pc, confidence > confidence_limit)
  }
  pc = decimate_points(pc, algorithm = homogenize(ppsqm, 1))
  if(!is.null(dem)){
    pc = lidR::normalize_height(pc, algorithm = dem)
  }
  return(pc)
}


