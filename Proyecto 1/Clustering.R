library(cluster)

names(nba_stats)
dim(nba_stats)
summary(nba_stats)

attach(nba_stats)

#set a list of numerical variables
names(nba_stats)

actives<-c(1:21)
dissimMatrix <- daisy(nba_stats[,actives], metric = "gower", stand=TRUE)

distMatrix<-dissimMatrix^2

h1 <- hclust(distMatrix,method="ward.D")  # NOTICE THE COST
#versions noves "ward.D" i abans de plot: par(mar=rep(2,4)) si se quejara de los margenes del plot

plot(h1)
lbl_clust <- cutree(h1, 4)
rect.hclust(h1, k=4, border=2:7)

c1 <- cutree(h1,8)
c2 <- cutree(h1,4)

#class sizes 
table(c2)
table(c1)
#comparing with other partitions
table(c1,c2)


names(nba_stats)
# min
boxplot(nba_stats[,4]~c2, horizontal=TRUE)

# pts
boxplot(nba_stats[,18]~c2, horizontal=TRUE)

# plus_minus
boxplot(nba_stats[,19]~c2, horizontal=TRUE)

pairs(nba_stats[,1:7], col=c2)

plot(PTS,START_POSITION,col=c2,main="Clustering of credit data in 3 classes")
legend("topright",levels(c2),pch=1,col=c(1:4), cex=0.6)

cdg <- aggregate(as.data.frame(nba_stats),list(c2),mean)
cdg

plot(WIN, PLUS_MINUS, col= c2)
points(cdg[,4],cdg[,5],pch=16,col="orange")
text(cdg[,4],cdg[,5], labels=cdg[,1], pos=2, font=2, cex=0.7, col="orange")

potencials<-c(3,4,18,21,13,19)
pairs(nba_stats[,potencials],col=c2)

#Profiling plots

