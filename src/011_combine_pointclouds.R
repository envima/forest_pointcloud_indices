pc1 = readLAS("data/level1/normalized_pointclouds/2020_09_15_densecloud.laz")
pc2 = readLAS("data/level1/normalized_pointclouds/2020_11_12_densecloud.laz")
pc3 = readLAS("data/level1/normalized_pointclouds/2020_12_10_densecloud.laz")
pc4 = readLAS("data/level1/normalized_pointclouds/2020_04_18_densecloud.laz")
pc5 = readLAS("data/level1/normalized_pointclouds/2020_04_22_densecloud.laz")



# fall pointcloud
pccomb = rbind(pc1, pc2, pc3)
pccomb = decimate_points(pccomb, algorithm = homogenize(50, 1))

# spring pointcloud
pccombs = rbind(pc3, pc4, pc5)
pccombs = decimate_points(pccombs, algorithm = homogenize(50, 1))

dir.create("data/level1/combined_pointclouds")
writeLAS(pccomb, "data/level1/combined_pointclouds/2020_fall_multi_densecloud.laz")
writeLAS(pccombs, "data/level1/combined_pointclouds/2020_spring_multi_densecloud.laz")

