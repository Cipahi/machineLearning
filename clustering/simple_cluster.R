# Simple Cluster
newiris <- iris
newiris$Species <- NULL

# Use KMeans w/newiris data cluster size 3
(kc <- kmeans(newiris, 3)) 

# view table results
table(iris$Species, kc$cluster)

# Plot results
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)