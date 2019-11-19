library(ggplot2)


df <- structure(list(City = structure(c(2L,
     3L, 1L), .Label = c("Minneapolis", "Phoenix",
     "Raleigh"), class = "factor"), January = c(52.1,
     40.5, 12.2), February = c(55.1, 42.2, 16.5),
     March = c(59.7, 49.2, 28.3), April = c(67.7,
         59.5, 45.1), May = c(76.3, 67.4, 57.1),
     June = c(84.6, 74.4, 66.9), July = c(91.2,
         77.5, 71.9), August = c(89.1, 76.5,
         70.2), September = c(83.8, 70.6, 60),
     October = c(72.2, 60.2, 50), November = c(59.8,
         50, 32.4), December = c(52.5, 41.2,
         18.6)), .Names = c("City", "January",
     "February", "March", "April", "May", "June",
     "July", "August", "September", "October",
     "November", "December"), class = "data.frame",
     row.names = c(NA, -3L))
dfm <- melt(df, variable_name = "month")
levels(dfm$month) <- month.abb
p <- ggplot(dfm, aes(month, value, group = City,
     colour = City))
(p1 <- p + geom_line(size = 1))



################



p <- ggplot(dfm, aes(month, value, group = City,
     colour = City)) + geom_line(size = 1) +
     opts(legend.position = "none")
p + geom_text(data = dfm[dfm$month == "Dec",
     ], aes(label = City), hjust = 0.7, vjust = 1)