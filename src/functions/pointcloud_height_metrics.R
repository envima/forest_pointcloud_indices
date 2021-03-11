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
  perc02 = quantile(z, .2)

  return(
    list(
      canopy_cover = (length(z[z > perc02]) / length(z))*100,
      z_max = max(z),
      z_mean95 = mean(z[z > perc95]),
      z_mean_csm = mean(z[rn == 1]),
      z_sd_csm = sd(z[rn == 1])

    )
  )
}

chmMetrics = function(z){


  list(

    n_points = length(z),
    n_points10 = length(z[z < quantile(z, .1)]),
    n_points20 = length(z[z < quantile(z, .2) & z >= quantile(z, .1)]),
    n_points30 = length(z[z < quantile(z, .3) & z >= quantile(z, .2)]),
    n_points40 = length(z[z < quantile(z, .4) & z >= quantile(z, .3)]),
    n_points50 = length(z[z < quantile(z, .5) & z >= quantile(z, .4)]),
    n_points60 = length(z[z < quantile(z, .6) & z >= quantile(z, .5)]),
    n_points70 = length(z[z < quantile(z, .7) & z >= quantile(z, .6)]),
    n_points80 = length(z[z < quantile(z, .8) & z >= quantile(z, .7)]),
    n_points90 = length(z[z < quantile(z, .9) & z >= quantile(z, .8)]),
    n_points100 = length(z[z < quantile(z, 1) & z >= quantile(z, .9)]),

    z10 = quantile(z, .1),
    z20 = quantile(z, .2),
    z30 = quantile(z, .3),
    z40 = quantile(z, .4),
    z50 = quantile(z, .5),
    z60 = quantile(z, .6),
    z70 = quantile(z, .7),
    z80 = quantile(z, .8),
    z90 = quantile(z, .9),
    z100 = quantile(z, 1)

  )

}


