metrics = function(z){
  return(
    list(
      z_mean = mean(z),
      z_max = max(z),
      z_min = min(z),
      z_sd = sd(z),
      z_range = max(z) - min(z),
      z_shannon = vegan::diversity(z, index = "shannon"),
      n_points = length(z)
    )
  )
}


bakx1 = function(z, rn){
  
  perc95 = quantile(z, .95)
  perc02 = quantile(z, .1)
  
  return(
    list(
      canopy_cover = (length(z[z > perc02]) / length(z))*100,
      z_max = max(z),
      z_mean95 = mean(z[z > perc95]),
      z_mean_csm = mean(z[rn == 1]),
      z_sd_csm = sd(z[rn == 1]),
      cv = mean(z) / sd(z)
      
    )
  )
}


