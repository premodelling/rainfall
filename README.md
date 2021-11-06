<br>

## Rainfall

* [References](#references)
* [Independent Development Environment](#independent-development-environments)

<br>

The *Group B3 Rainfall Project* thus far:

* Within the parent directory
  * a [rmarkdown based report](./rainfall.rmd) in development
  
* Within directory [R](./R)
  * a [play area](./R/rainfall.R) were we explore ideas
  * a [directory of functions](./R/functions), which are used by the rmarkdown report  
  
<br>
<br>

### Snippets

**Ordering**
```R
dataframe %>%
  arrange(fieldname)
```
or
```
dataframe[order(dataframe$fieldname), ]
```


**Extracting parts of a data**
```
# extract month code
format(dataframe$date, format = '%m')
```

<br>
<br>

### References

**R**
* [Tidyverse Style Guide](https://style.tidyverse.org/index.html)
* [Reproducible Reports with R & R Markdown](https://claudiofronterre.github.io/reproduceR/reproduceR.html)


<br>

**ggplot2**
* [labs, i.e., labels](https://ggplot2.tidyverse.org/reference/labs.html)
* [geom_text](https://ggplot2.tidyverse.org/reference/geom_text.html)
* [theme](https://ggplot2.tidyverse.org/reference/theme.html)
* [element](https://ggplot2.tidyverse.org/reference/element.html)
* [title, subtitle, caption, tag](https://r-charts.com/ggplot2/titles/)
* [dodge](https://ggplot2.tidyverse.org/reference/position_dodge.html): **The peculiar cases of *dodge***
* [a guide to tick marks & labels](http://www.sthda.com/english/wiki/ggplot2-axis-ticks-a-guide-to-customize-tick-marks-and-labels)
* [save](https://ggplot2.tidyverse.org/reference/ggsave.html)
* figures:
  * [figures](https://ben-williams.github.io/updated_ggplot_figures.html)
  * [r markdown, figures, & knitr](https://sebastiansauer.github.io/figure_sizing_knitr/)
  * [figure sizing](https://bookdown.org/yihui/rmarkdown-cookbook/figure-size.html)
  * https://stackoverflow.com/questions/13540955/ggplot2-figure-size-with-rmarkdown?answertab=votes#tab-top

<br>

**r markdown**
* [knitr chunk options](https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html)

<br>

**LaTeX**
* https://en.wikibooks.org/wiki/LaTeX


<br>
<br>


### Independent Development Environments

**IntelliJ**

* Edit the help file skeletons in 'man', possibly combining help files
  for multiple functions.
* Edit the exports in 'NAMESPACE', and add necessary imports.
* Put any C/C++/Fortran code in 'src'.
* If you have compiled code, add a useDynLib() directive to
  'NAMESPACE'.
* Run R CMD build to build the package tarball.
* Run R CMD check to check the package tarball.

Read "Writing R Extensions" for more information.