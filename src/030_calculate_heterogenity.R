# 005 horizontal heterogenity


# create directory structure
## for metric group
list.files("data/results", pattern = "0[12]m.grd$", recursive = TRUE, full.names = TRUE) %>%
  stringr::word(start = 1, end = 3, sep = "/") %>%
  stringr::str_replace("data/results", "data/results/heterogenity") %>%
  unique() %>% map(dir.create)

# for dataset names
list.files("data/results", pattern = "0[12]m.grd$", recursive = TRUE, full.names = TRUE) %>%
  stringr::word(start = 1, end = 4, sep = "/") %>%
  stringr::str_replace("data/results", "data/results/heterogenity") %>%
  unique() %>% map(dir.create)


list.files("data/results", pattern = "0[12]m.grd$", recursive = TRUE, full.names = TRUE) %>%
  map(function(f){
    m  = stack(f)
    het = aggregate(m, 10, fun=sd)
    names(het) = paste0(names(het), "_sd")
    writeRaster(het, f %>%
                  str_replace("data/results", "data/results/heterogenity") %>%
                  str_replace(pattern = ".grd", replacement = "_heterogenity_10m.grd"),
                overwrite = TRUE)
  })




