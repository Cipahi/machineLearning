# load lib for page-rank algorithim
library(igraph)
g <- random.graph.game(20, 5/20, directed=TRUE)
page.rank(g)$vector

g2 <- graph.star(10)
page.rank(g2)$vector

# Personalized PageRank
g3 <- graph.ring(10)
page.rank(g3)$vector
reset <- seq(vcount(g3))
page.rank(g3, personalized=reset)$vector

# plotting a simple ring graph, all default parameters, except the layout
g <- graph.ring(10)
g$layout <- layout.circle
plot(g)
tkplot(g)
rglplot(g)

# plot a random graph, different color for each component
g <- erdos.renyi.game(100, 1/100)
comps <- clusters(g)$membership
colbar <- rainbow(max(comps)+1)
V(g)$color <- colbar[comps+1]
png("netball1.png", bg="transparent", width=580,height=335)
plot(g, layout=layout.fruchterman.reingold, vertex.size=5, vertex.label=NA)
dev.off()

# plot communities in a graph
g <- graph.full(5) %du% graph.full(5) %du% graph.full(5)
g <- add.edges(g, c(0,5, 0,10, 5,10))
com <- spinglass.community(g, spins=5)
V(g)$color <- com$membership+1
g <- set.graph.attribute(g, "layout", layout.kamada.kawai(g))
plot(g, vertex.label.dist=1.5)

# draw a bunch of trees, fix layout
igraph.options(plot.layout=layout.reingold.tilford)
plot(graph.tree(20, 2))
plot(graph.tree(50, 3), vertex.size=3, vertex.label=NA)
tkplot(graph.tree(50, 2, mode="undirected"), vertex.size=10,
       vertex.color="green")