###############
# PARTY package
library(party)

(ct = ctree(frmla, data = raw))
plot(ct, main="Conditional Inference Tree")

#Table of prediction errors
table(predict(ct), raw$Metal)

# Estimated class probabilities
tr.pred = predict(ct, newdata=raw, type="prob")