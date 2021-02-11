# 005 horizontal heterogenity


list.files("data/results/", pattern = "01m.grd$", recursive = TRUE, full.names = TRUE) %>%
  map(function(f){

    m  = stack(f)
    het = aggregate(m, 10, fun=sd)
    names(het) = paste0(names(het), "_sd")
    writeRaster(het, f %>% str_replace(pattern = "_01m.grd", replacement = "_heterogenity_10m.grd"))
  })




