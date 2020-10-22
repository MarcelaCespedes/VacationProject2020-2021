
# See here
# https://stackoverflow.com/questions/45052188/how-to-plot-3d-scatter-diagram-using-ggplot

# for code
# Friday 23rd October
# I think plotly would be the way to go in terms of html reports 
# for the biomarkers
set.seed(417)
library(plotly)
temp <- rnorm(100, mean=30, sd=5)
pressure <- rnorm(100)
dtime <- 1:100

source("print_app.r")
print_app(plot_ly(x=temp, y=pressure, z=dtime, type="scatter3d", mode="markers", color=temp), name = "Plot_3D")
