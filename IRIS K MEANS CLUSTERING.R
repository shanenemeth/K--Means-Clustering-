library(factoextra)

iris.labels <- iris$Species
table(iris.labels)

iris_data <- iris[1:4]

iris_data_scale <- scale(iris_data)
fviz_nbclust(iris_data_scale, kmeans, method = "wss") +
labs(subtitle = "Elbow Method")
set.seed(1234)
KM <- kmeans(iris_data_scale,3, nstart = 100)
print(KM)

head(cbind(iris_data_scale, cluster = KM$cluster))

rownames(iris_data_scale) <- paste(iris$Species, 1:dim(iris)[1], sep = "_")
iris_data_scale
fviz_cluster(list(data = iris_data_scale, cluster = KM$cluster))

table(KM$cluster, iris$Species)
