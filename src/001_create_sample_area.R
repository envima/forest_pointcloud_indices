# crop to sample area

grid10 = raster(paste0(envrmt$areas, "/mof_grid_10m.tif"))
grid10_halfmoon = crop(grid10, e)
writeRaster(grid10_halfmoon, paste0(envrmt$areas, "/sample_area_grid_10.tif"), overwrite = TRUE)



# create polygon from extent

grid_poly = as(extent(e), "SpatialPolygons")
grid_poly = st_as_sf(grid_poly)
st_crs(grid_poly) = 25832
st_write(grid_poly, paste0(envrmt$areas, "/sample_area.gpkg"))



