library(readr)
library(Rtsne)
library(RColorBrewer)
library(superml)


data <- read.csv("DBP_wiki_data.csv")

data <- data[sample(nrow(data)),]
data <- data[1:2000,]

label <- data$l1
colors = rainbow(length(unique(label)))
names(colors) = unique(label)
text <- data[,1]



# initialise the class
tfv <- TfIdfVectorizer$new(max_features = 200, remove_stopwords = TRUE)

# generate the matrix
tf_mat <- tfv$fit_transform(text)
data_tf <- tf_mat[,]

tsne <- Rtsne(data_tf, dims = 2, perplexity=40, check_duplicates = FALSE, verbose=TRUE, max_iter = 5000)



plot(tsne$Y,bg=colors[label],col=colors[label],pch = 19)

