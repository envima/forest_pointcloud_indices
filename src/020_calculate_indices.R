# calculate indices




list.files("data/level1/normalized_pointclouds/", full.names = TRUE) %>%
  map(function(f){

    filename =  basename(f) %>% str_remove(pattern = "\\.[a-z]+")
    outdir = paste0("data/results/", filename)
    dir.create(outdir, showWarnings = FALSE)

    pc = readLAS(f)

    all_resolutions = map(res, function(r){
      outfile = file.path(outdir, paste0(filename, "_", str_pad(r, width = 2, pad = 0), "m.grd"))

      g = createSampleArea(sample_extent = e, resolution = r)
      metric = lidR::grid_metrics(pc, func = ~bakx1(Z, ReturnNumber), res = g)

      writeRaster(metric, outfile)
      return(metric)
    })
    saveRDS(all_resolutions, file.path(outdir, paste0(filename, ".RDS")))
  })

