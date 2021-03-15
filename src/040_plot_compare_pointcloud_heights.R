# height histograms

f = "data/level1/normalized_pointclouds//2018_01_01_lidar.las"

pc_heights = c(list.files("data/level1/normalized_pointclouds/", full.names = TRUE), list.files("data/level1/combined_pointclouds/", full.names = TRUE)) %>%
  map_dfr(function(f){
    pc = readLAS(f)
    return(tibble(dataset = word(basename(f), 1, 1, "\\."), Z = pc@data$Z))

  })



density_plot_single = ggplot(pc_heights %>% filter(dataset %in% c("2020_04_18_densecloud", "2020_04_22_densecloud",
                                            "2020_09_15_densecloud", "2020_11_12_densecloud", "2020_12_10_densecloud")),
       aes(y = Z, fill = dataset, color = dataset))+
  geom_density(alpha = 0.3)+
  geom_density(data = pc_heights %>% filter(dataset == "2018_01_01_lidar"),
               mapping = aes(y = Z), color = "black", fill = NA)+
  theme_bw()

saveRDS(density_plot_single, "doc/figures/pointcloud_height_comparison_single.RDS")


density_plot_comb = ggplot(pc_heights %>% filter(dataset %in% c("spring_densecloud", "fall_densecloud")),
       aes(y = Z, fill = dataset, color = dataset))+
  geom_density(alpha = 0.3)+
  geom_density(data = pc_heights %>% filter(dataset == "2018_01_01_lidar"),
               mapping = aes(y = Z), color = "black", fill = NA)+
  theme_bw()


saveRDS(density_plot_comb, "doc/figures/pointcloud_height_comparison_comb.RDS")







