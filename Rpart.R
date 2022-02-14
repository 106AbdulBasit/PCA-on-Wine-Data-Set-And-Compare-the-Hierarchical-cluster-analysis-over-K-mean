Wine.table = read.delim("WineData.txt")
View(Wine.table)
Wine.data = scale(Wine.table[-1])
labels = Wine.table[,c(1)]
X = c(labels)
wineclust = hclust(dist(Wine.data,method = "euclidean" ), method = "ward.D2")
plot(wineclust, labels=X, cex=0.40, hang=-2)
rect.hclust(wineclust, k=3, border = "Green")


Wine.data = scale(Wine.table[-1])
Wine.data.cor = cor(Wine.data)
Wine.data.eig = eigen(Wine.data.cor)
Wine.data.eigval = cbind(Wine.data.eig$values)
PrWinedata.eigval = Wine.data.eigval/sum(Wine.data.eigval)
cumsum(PrWinedata.eigval)

plot(Wine.data.eigval)
plot(PrWinedata.eigval)
plot(cumsum(PrWinedata.eigval))






