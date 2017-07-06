#!/usr/bin/env Rscript

orig<-read.table("/home/oziolore/restoreFromData/fhet/data/angsd/keepsites.bed", header=F)

p<-(orig[,3]-orig[,2])/(sum(orig[,3]-orig[,2]))

p<-unlist(p)

v<-sample(x=length(p),size=8000,prob=p)

v<-sort(v)

write.table(orig[v,], file="/home/oziolore/restoreFromData/fhet/data/angsd/keep50Mb.bed",row.names=FALSE,col.names=FALSE,quote=FALSE)
