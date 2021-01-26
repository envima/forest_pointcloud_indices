# crop lidar data

lidar2018 = lidR::readLAS("/home/marvin/data/remotesensing/lidar/mof/mof_lidar_2018.las")

sample_area = extent(grid10_halfmoon)

lidar2018 = lasclip(lidar2018, sample_area)
gc()

# homogenize to 50 points per sqm
lidar2018 = lidR::decimate_points(lidar2018, algorithm = homogenize(50, res = 1))
# fix referencing
epsg(lidar2018) = 25832

writeLAS(lidar2018, paste0(envrmt$lidar, "/lidar2018_halfmoon_sample.las"))
