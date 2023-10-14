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
