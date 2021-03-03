#' Pointcloud index calculation
#' @description Calculates pointcloud indices for different resolutions and metrics
#'
#' @param pc_file character, filepath to a pointcloud
#' @param indices formula, the metric formula used in lidR::grid_metrics (starts with a ~)
#' @param resolutions integer, the resolutions to calculate
#'
#' @return list with rasterstacks
#'
#' @author Marvin Ludwig
#'
#' @export

#

calculateIndices = function(pc_file, indices, resolutions = c(1,2,4,5,8,10)){

  pc_name = word(basename(pc_file), start = 1, end = 1, sep = "\\.")


  outdir = file.path("data/results/", rlang::call_name(indices))
  outdir2 = file.path(outdir, pc_name)

  # create directory names after metrics used
  dir.create(outdir)
  dir.create(outdir2)

  pc = lidR::readLAS(pc_file)

  all_resolutions = map(resolutions, function(r){
    outfile = file.path(outdir2, paste0(pc_name, "_", str_pad(r, width = 2, pad = 0), "m.grd"))

    g = createSampleArea(sample_extent = e, resolution = r)
    metric = lidR::grid_metrics(pc, func = indices, res = g)

    writeRaster(metric, outfile, overwrite = TRUE)
    return(metric)
  })



}
