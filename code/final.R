#################################################
## Stat 6560  Final Project
## Autumn 2021
#################################################

library(MASS)   # load library MASS

# read data files --------------------------------

data.7 <- read.csv("train.7.txt", header = F)
data.7 <- as.matrix(data.7)
data.9 <- read.csv("train.9.txt", header = F)
data.9 <- as.matrix(data.9)

# > dim(data.7) # data set dimension
# [1] 645 256
# > dim(data.9)
# [1] 644 256

# visualize the digit images ---------------------
# note: each row corresponds to one observation or a digit
 
# For example, pick the first observation of "7"
i <- 1 

# turn a 256 row vector into a 16x16 matrix 
img <- matrix(as.vector(data.7[i,]), nrow = 16, ncol=16)

# display the matrix in grayscale
image(img[,16:1], col=gray((32:0)/32), axes=F)

# "16:1" reverses the column order for proper display of the image.
# grayscale "(32:0)/32" maps low pixel values to dark shades.


# since we need to visualize vectors as images many times in this analysis,
# define a function called "digit.image" which takes a 256 vector as input
# and displays the corresponding 16x16 matrix as a grayscale image:

digit.image <- function(x)
               { img <- matrix(as.vector(x), nrow = 16, ncol=16) 
               	 image(img[,16:1], col=gray((32:0)/32), axes=F)
               	 box(col=3)
               	}

# try the new function!
digit.image(data.7[i,])

# visualize the first five "7" and the first five "9" images
par(mfrow=c(2,5), omi=rep(0,4), mar=rep(0.2,4)) # 2x5 display
for (i in 1:5)
{ digit.image(data.7[i,]) }
for (i in 1:5)
{ digit.image(data.9[i,]) }

par(mfrow=c(1,1))

# split data into a training set and a test set --------------

data.7.train <- data.7[1:400,]
data.7.test <- data.7[401:645,]

data.9.train <- data.9[1:400,]
data.9.test <- data.9[401:644,]

# training data
data.train <- rbind(data.7.train, data.9.train)
# > dim(data.train)
# [1] 800 256
label.train <- c(rep(7,400), rep(9,400)) # class labels for training data

# test data
data.test <- rbind(data.7.test, data.9.test)
# > dim(data.test)
# [1] 489 256
label.test <- c(rep(7,245), rep(9,244)) # class labels for test data


# PCA  -----------------------





# LDA  -----------------------
col.sd <- apply(data.train, 2, sd)  # compute columnwise standard deviation
# > sum(col.sd==0)   # 18 variables with zero SD!
# [1] 18

# > summary(col.sd)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.0000  0.1676  0.5481  0.4588  0.7320  0.8543 

# visualize col.sd
digit.image(col.sd)

# let's use only those variables with SD>0.2
col.ind <- (1:256)[col.sd>0.2]  # this contains the indices of variables with SD>0.2 
lda.79 <- lda(data.train[,col.ind], label.train) # lda(x, grouping)

LD1 <- rep(0,256)
LD1[col.ind] <- lda.79$scaling   # linear discriminant coefficients as a 256 dim vector
digit.image(LD1)
digit.image(abs(LD1)) # visualize the absolute values of the coefficients
