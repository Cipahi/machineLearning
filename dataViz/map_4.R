library(ggplot2)
library(maps)
#load us map data
all_states <- map_data("state")
#plot all states with ggplot
states <- subset(all_states, region %in% c("washington","idaho","oregon","nevada","montana","wyoming","utah") )
p <- ggplot()
p <- p + geom_polygon( data=states, aes(x=long, y=lat, group = group),colour="white", fill="white" )
p

# change the name of the header to change labels
mydata <- read.csv("salesloc.csv", header=TRUE, row.names=1, sep=",")

# create png file
png("salesmap.png", bg="transparent", width=480,height=235)
dev.copy(png,'myplot.png' bg="transparent")

p <- ggplot()
p <- p + geom_polygon( data=states, aes(x=long, y=lat, group = group),colour="white", fill="steelblue" )
# p <- p + geom_jitter( data=mydata, position=position_jitter(width=0.5, height=0.5), aes(x=lon, y=lat, size = tot_sales_zip, color="coral1")) + scale_size(name="Total Sales")
p <- p + geom_jitter( data=mydata, position=position_jitter(width=0.5, height=0.5), aes(x=lon, y=lat, size = tot_sales_zip,color=state_prefix)) + scale_size(name="total_sales")
# p <- p + geom_text( data=mydata, hjust=0.5, vjust=-0.5, aes(x=lon, y=lat, label=state_prefix), colour="gold2", size=2 )
p
dev.off()