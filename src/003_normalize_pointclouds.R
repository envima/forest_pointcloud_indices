# 003 normalize pointclouds

fls = list.files("data/imports/uas/", full.names = TRUE)


for(f in fls){
  pc = readLAS(f)
  # throw out confidence < 2 in denseclouds. so a point is based on at least 2 depth maps
  pc = filter_poi(pc, confidence > 2)
  pc = decimate_points(pc, algorithm = homogenize(50, res = 1))
  writeLAS(pc, paste0("data/level0/uas/", basename(f)))
}

