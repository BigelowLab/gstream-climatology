suppressPackageStartupMessages({
  library(gstream)
  library(rnaturalearth)
  library(RColorBrewer)
  library(stars)
  library(sf)
  library(dplyr)
})

DATAPATH="~/Library/CloudStorage/Dropbox/data/gstream/agg/oisst"
COAST = rnaturalearth::ne_coastline(scale = "medium", returnclass = "sf")


# List available files
# @param pattern regex pattern for filtering files
# @param path the data path
list_files = function(pattern = glob2rx("*.tif"),
                      path = DATAPATH){
  
  list.files(path, recursive = TRUE, full.names = TRUE, pattern = pattern)
}

add_coast = function(...,coast = COAST){
  plot(sf::st_geometry(coast), add = TRUE, col = "black")
}

double_plot = function(orange, blue, month){
  index = which(month == month.abb)
  plot(slice(x, "time", index), 
       reset = FALSE, 
       breaks = "equal",
       nbreaks = nbreaks,
       key.pos = NULL,
       main = NULL,
       col = brewer.pal(nbreaks - 1 , "Oranges"))
  plot(slice(y, "time", index), 
       add = TRUE, 
       breaks = "equal",
       nbreaks = nbreaks,
       key.pos = NULL,
       main = month,
       col = brewer.pal(nbreaks - 1 , "Blues"))
  add_coast()
}
