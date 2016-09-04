#
## Simple Cluster Analysis
## with scatterplot3d
## Enhanced: Gus Segura
#

## Four way

# Create dummy data :: Clustering is a Distance Measure
set.seed(1234)
data <- data.frame(
        a = sample(1:5, 1000, replace=TRUE),
        b = sample(1:5, 1000, replace=TRUE),
        c = sample(1:5, 1000, replace=TRUE),
        d = sample(1:5, 1000, replace=TRUE)
)

# Perform clustering
data <- scale(data)

myclust <- kmeans(data, 10)
print(myclust)
summary(myclust)
myclust$size
myclust$cluster

# X11
X11(type="Xlib")

# Represent the data in 2D and colour by cluster
distances <- dist(data, method="euclidean")
mycmdscale <- cmdscale(distances, 2)
plot(mycmdscale, cex=0)
points(mycmdscale, col=myclust$cluster)
plot

# Let's try 3D (you need to install scatterplot3d first)
library(scatterplot3d)
mycmdscale <- cmdscale(distances, 3)
X11(type="Xlib")
s3d <- scatterplot3d(mycmdscale, 
                     color=myclust$cluster, 
                     xlab="DistanceX",
                     ylab="DistanceY",
                     zlab="DistanceZ")

# Let's try interactive 3D
library(rgl) # Need to install this package first
X11(type="Xlib")
plot3d(mycmdscale, 
       col=myclust$cluster, 
       size=8,
       xlab="DistanceX",
       ylab="DistanceY",
       zlab="DistanceZ")
