# calculate indices

fls = list.files("data/level0", pattern = ".laz$|.las$", recursive = TRUE, full.names = TRUE)
out_fls = stringr::str_replace(fls, "level0", "level1")

# create level1 directories
for(i in unique(dirname(out_fls))) dir.create(path = i)

# calculate indices

g = raster("data/level0/areas/sample_area_grid_10.tif")


for(f in seq(length(fls))){
  pc = lidR::readLAS(fls[f])
  metrics = grid_metrics(pc, func = ~bakx1(Z, ReturnNumber), res = g)
  writeRaster(metrics, out_fls[f], overwrite = TRUE)
}
