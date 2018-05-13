#!/usr/bin/env Rscript

orig<-read.table("/data/oziolore/fhet/data/angsd2/keepsites2.bed", header=F) #reading in the keepsites file

p<-(orig[,3]-orig[,2])/(sum(orig[,3]-orig[,2])) #creating probability vector so that I don't oversample large chunks

p<-unlist(p) #unlisting the vector

z<-p<0 #removing any negative probabilities for 0 values
p<-p[!z] #applying that to vector

v<-sample(x=length(p),size=11500,prob=p) #sampling 11500 chunks with probability to get out ~50Mb of the genome
v<-sort(v)
sum(orig[v,3]-orig[v,2]) #checking the total size of bases

write.table(orig[v,], file="/data/oziolore/fhet/data/angsd2/keep50Mb.bed",row.names=FALSE,col.names=FALSE,quote=FALSE)
