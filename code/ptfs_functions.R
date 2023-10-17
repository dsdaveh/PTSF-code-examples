amtrak_ts_annotations <- function(y=2500, y_pad = 50) {
  lines(c(2004.25 - 3, 2004.25 - 3), c(-3500, 3500)) 
  lines(c(2004.25, 2004.25), c(-3500, 3500))
  text(1996.25, y, "Training")
  text(2002.75, y, "Validation")
  text(2005.25, y, "Future")
  arrows(2004 - 3, y - y_pad, 1991.25, y - y_pad, code = 3, length = 0.1, lwd = 1,angle = 30)
  arrows(2004.5 - 3, y - y_pad, 2004, y - y_pad, code = 3, length = 0.1, lwd = 1,angle = 30)
  arrows(2004.5, y - y_pad, 2006, y - y_pad, code = 3, length = 0.1, lwd = 1, angle = 30)
}

#ggplot2 version

arrow_look <- function() arrow(ends = "both", length = unit(.3, "cm"))

#create a function to annotate the ridership plot
ridership_annotation <- function(plt, y = 2500,
                                 trn_month = yearmonth('2001 Apr'),
                                 val_month = yearmonth('2004 Apr')) {
  y_txt <- y + 75
  y_arrow <- y
  
  tv_date <- trn_month |> as.Date()
  vf_date <- val_month |> as.Date()
  
  #get the minimum and maximum values of the x date from the plt object 
  min_date <- min(plt$data$Month) |> as.Date()
  max_date <- max(plt$data$Month) |> as.Date()
  
  plt +
    #add vertical lines for partions
    geom_vline(xintercept = tv_date ) +
    geom_vline(xintercept = vf_date |> as.Date()) +
    
    #add labels for partitions
    annotate("text", x = ymd('1999 Apr 01'), y = y_txt, label = 'Training') +
    annotate("text", x = ymd('2002 Oct 01'), y = y_txt, label = 'Validation') +
    annotate("text", x = ymd('2005 Apr 01'), y = y_txt, label = 'Future') +
    
    #add arrows for partitions
    annotate("segment", arrow = arrow_look(),
             x = min_date + days(30), y = y_arrow, 
             xend = tv_date - days(30), yend = y_arrow) +
    annotate("segment", arrow = arrow_look(),
             x = tv_date + days(30), y = y_arrow,
             xend = vf_date - days(30), yend = y_arrow) +
    annotate("segment", arrow = arrow_look(),
             x = vf_date + days(30), y = y_arrow,
             xend = max_date - days(30), yend = y_arrow) +
    theme_minimal()
}