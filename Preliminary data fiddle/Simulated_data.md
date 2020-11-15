__1. Good R tutorials:__

- Good general R introduction and basic (and very good) visualisation tips + code, [here](https://towardsdatascience.com/a-guide-to-data-visualisation-in-r-for-beginners-ef6d41a34174).

- Good tutorial with code to incrementally start plotting and visualising data in 3D, finishes off with fitting plane over data points and creation of a movie/ html file. Link available [here](http://www.sthda.com/english/wiki/a-complete-guide-to-3d-visualization-device-system-in-r-r-software-and-data-visualization).

- Other good tutorial. Plots here resemble those generated in matlab. Link available [here](http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization).

- Tips for good 3D visualisation of data, link available [here](https://www.data-to-viz.com/caveat/3d.html). Quote "As with any good visualisation, it makes understanding accessible, providing a visual explanation of a potentially (at least for me) complicated subject matter." taken from [here](https://www.visualisingdata.com/2015/03/when-3d-works/).

- Good tutorial for fitting a plane available link available [here](https://bio723-class.github.io/Bio723-book/fitting-regression-models-in-r.html#multiple-regression)
Section 12.6 onwards.

<br>

__2. Explore synthetic A/T/N data__

Run R code Synthetic_data.r to simulate, visualise and do preliminary exploration of ATN data.

- Fit a smoothed curve/ plane through points. 

- What does this tell you about the relationships between the biomakers?

- What metrics can you use to interpret these associations?

- What aesthetics are important when visualising 3D data? implement them.

- What features/ associations can you describe in 3D that are limited in 2D?

If possible, generate a short video/ snippet highlighting important features of this data.

<br>


__3. Tasks TODO:__

- Improve on visualisations, insert planes to mark biomarker cut-offs.

- Propose methodolgy to fit curve/ plane to data.

- Reference methodology in literature.

- Think about longitudinal data for biomarkers.

<br>

__4. Statistical literature__

- Good paper to peruse: it would be interesting to use these methods for the ATN model, in a 3 x 3 plot to investigate for associations. It would also be of interest to see if if this was available for higher dimensional case, i.e. view two variables against a third in a null hypothesis setting (H0 is true), versus when H0 is not true.

_Buja, A., Cook, D., Hofmann, H., Lawrence, M., Lee, E.K., Swayne, D.F. and Wickham, H., 2009. Statistical inference for exploratory data analysis and model diagnostics. Philosophical Transactions of the Royal Society A: Mathematical, Physical and Engineering Sciences, 367(1906), pp.4361-4383._

- Good R package to consider: tourr, repository and example available [here](https://github.com/ggobi/tourr).
TODO: look up other examples and publicly available data to familiarise tourr package.

Paper to accompany package available [here](https://core.ac.uk/download/pdf/6287941.pdf)
_Wickham, H., Cook, D., Hofmann, H. and Buja, A., 2011. tourr: An R package for exploring multivariate data with projections. Journal of Statistical Software, 40(2), pp.1-18._

