# create polygon from extent

grid_poly = as(extent(e), "SpatialPolygons")
grid_poly = st_as_sf(grid_poly)
st_crs(grid_poly) = 25832
st_write(grid_poly, paste0(envrmt$areas, "/sample_area.gpkg"), append = FALSE)
