###############################################
# Taken from here
# https://stackoverflow.com/questions/44048347/r-open-plotly-in-standalone-window
#
# This is to open a ggplotly object in a seperate window
# similar to the x11() function - but for ggplotly
# and view interactive plot in html window

print_app <- function(widget, name = "Aplot") {
  
  # Generate random file name
  #temp <- paste(tempfile('plotly'), 'html', sep = '.')
  temp <- paste(name, ".html", sep = "")
  
  # Save. Note, leaving selfcontained=TRUE created files that froze my browser
  htmlwidgets::saveWidget(widget, temp, selfcontained = FALSE)
  
  # Launch with desired application
  system(sprintf("chromium-browser -app=file://%s", temp))
  
  # Return file name if it's needed for any other purpose
  temp
}