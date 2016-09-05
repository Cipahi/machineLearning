#!/usr/bin/env python
import Orange
data = Orange.data.Table("market-basket.basket")

# sample data
# Bread, Milk
# Bread, Diapers, Beer, Eggs
# Milk, Diapers, Beer, Cola
# Bread, Milk, Diapers, Beer
# Bread, Milk, Diapers, Cola

rules = Orange.associate.AssociationRulesSparseInducer(data, support=0.3)
print "%4s %4s  %s" % ("Supp", "Conf", "Rule")
for r in rules[:5]:
    print "%4.1f %4.1f  %s" % (r.support, r.confidence, r)
