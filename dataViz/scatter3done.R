## load scatter3d lib
library(scatterplot3d)

## load data and plot
d1<-read.table("65-555-reg.txt", header=T)
d2<-data.frame(time=c(d1[,1]), cases=c(d1[,2]), distance=c(d1[,3]))
attach(d2)
scatterplot3d(cases, distance, time, angle=20, col.axis="blue",
col.grid="lightblue", main="Three-dimensional scatterplot", 
pch=21, box=F, cex.symbols=2)
detach(d2)