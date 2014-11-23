library(dplyr)

run_analysis <- function() {
    # combine training info
    train.x <- read.table("UCI HAR Dataset/train/X_train.txt")
    test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
    total.x <- rbind(train.x, test.x)

    # filter and name training info
    # after this, total.x meets the requirements for step 4
    features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)$V2
    mean.and.std = grep("(mean|std)\\(", features)
    total.x <- total.x[, mean.and.std]
    names(total.x) <- make.names(features[mean.and.std])
    
    # get subject info
    train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
    test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
    total.subjects <- rbind(train.subjects, test.subjects)
    names(total.subjects) <- "subject"

    # get activity info
    activities <- read.table("UCI HAR Dataset/activity_labels.txt")$V2
    train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
    test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
    total.y <- rbind(train.y, test.y)
    total.y <- activities[total.y$V1]
        
    # combine info and summarize
    total <- cbind(total.subjects, activity = total.y, total.x) %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))
    
    # write data
    write.table(total, "run_analysis.txt", row.names = FALSE)
    
    total
}