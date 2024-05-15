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
  plot(sf::st_geometry(coast), add = TRUE, col = "green")
}
