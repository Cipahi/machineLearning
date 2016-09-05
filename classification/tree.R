###############
# TREE package
library(tree)

tr = tree(frmla, data=raw)
summary(tr)
plot(tr); text(tr)