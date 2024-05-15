Climatology
================

First let’s show the monthly climatologies.

``` r
month_lut = 1:12 |>
  rlang::set_names(month.abb)
ff = list_files(pattern = "*mc_mean.tif")
names(ff) = substring(basename(ff) , 11, 13)
ff = ff[month.abb]
x = stars::read_stars(ff, along = list(time = month.abb))
nbreaks = 9
plot(dplyr::slice(x, along = "time", index = 1:3), 
     hook = add_coast,
     breaks = "equal",
     nbreaks = nbreaks,
     key.pos = NULL,
     col = brewer.pal(nbreaks - 1, "Oranges"))
```

![](Climatology-oisst_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

And 2024…

``` r
ff = list_files(pattern = glob2rx("2024*mon_count.tif"))
dates = substring(basename(ff), 1, nchar("2010-01-01")) |>
  as.Date()
months = format(dates, "%b")
y = stars::read_stars(ff, along = list(time = months))
plot(dplyr::slice(y, along = "time", index = 1:3), 
     hook = add_coast,
     breaks = "equal",
     nbreaks = nbreaks,
     key.pos = NULL,
     col = brewer.pal(nbreaks - 1 , "Blues"))
```

![](Climatology-oisst_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

And one on top of the other (I hope!)

``` r
double_plot(x,y, "Jan")
```

![](Climatology-oisst_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
double_plot(x,y, "Feb")
```

![](Climatology-oisst_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
double_plot(x,y, "Mar")
```

![](Climatology-oisst_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->
