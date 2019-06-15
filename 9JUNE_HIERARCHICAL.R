install.packages("mltools")

library(class)
library(data.table)
A = data.frame(iris)
library(mltools)

head(B)
B = one_hot(as.data.table(A))
#---------KMEANS-----------
model_kmeans = kmeans(B,4)
model_kmeans$cluster
C = data.frame(B,CV_K= model_kmeans$cluster)
#---------HIERARCHICAL-----------
model_hc = hclust(dist(B),method = "complete")
#cutree(model_hc,h=3)
CV_hc = cutree(model_hc,k=4)  # K is the number of clusters
CV_hc_h = cutree(model_hc,h=2)  # height of the tindogram
CV_hc

?hclust

C = data.frame(C,CV_hc)
plot(model_hc)