#Sys.setenv(LANG = "en")
# Class 5 Data Visualization
x <- rnorm(1000)
#is.vector(x) == TRUE

#How many things are in x
length(x)
mean(x)
sd(x)
summary(x)

boxplot(x)
hist(x)
rug(x)

#2A
weight <- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5)

#2B
#read.delim for /t and header = TRUE
#read.table for txt files
#read.csv for excel files
mouse <- read.table("bimm143_05_rstats/feature_counts.txt", sep="\t", header=TRUE)
par(mar=c(5, 11.5, 4.1, 2.1))
#bottom, left, up, right
barplot(mouse$Count, names.arg=mouse$Feature, 
        horiz=TRUE, ylab="", 
        main="Number of features in the mouse GRCm38 genome", 
        las=1,xlim=c(0,80000))

#2C
par(mar=c(2.1,4.1,4.1,2.1))
x <- c(rnorm(10000),rnorm(10000)+4)
hist(x,breaks = 50)

#3A
mf <- read.delim("bimm143_05_rstats/male_female_counts.txt")
barplot(mf$Count, col = rainbow(2))

#3B
genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
nrow(genes)
table(genes$State)
levels(genes$State)
palette(c("blue","grey","red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, 
     xlab="Expression condition 1", ylab="Expression condition 2")

#3C
meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
nrow(meth)
plot(meth$gene.meth,meth$expression) 

dcols <- densCols(meth$gene.meth, meth$expression)
plot(meth$gene.meth, meth$expression, col = dcols, pch = 20)

index <- meth$expression >0 
x <- meth$gene.meth[index]
y <- meth$expression[index]
dcols2 <- densCols(x,y)
plot(x,y,col = dcols2, pch = 20)

dcols3 <- densCols(x,y,colramp = colorRampPalette(c("blue","green","red","yellow")))
plot(x,y,col = dcols3,pch = 20)

