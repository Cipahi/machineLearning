library(wordcloud2)
# wordcloud2(data = demoFreq)

x <- paste(rep("cloud cloud cloud big big blueskymetrics blueskymetrics analytics knowledge mining tools
techniques knowledge discovery data warehousing predictive analytics data mining big data business intelligence
socialmedia twitter relevance", 3), 
           collapse = " ")
X <- data.frame(table(strsplit(x, " ")))
COL <- ifelse(X$Var1 %in% c("word","cloud","words","data"), "white", "black")
png("bsm_wc1.png", bg="transparent", width=580,height=335)
# wordcloud(X$Var1, X$Freq, min.freq=1,max.words=100, random.order=T, rot.per=.15, colors=COL)
wordcloud2(X, color = "random-light", backgroundColor = "grey")
dev.off()