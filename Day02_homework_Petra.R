# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

?read.table

adaption.innovation <- read.csv("Adaption_Innovation_Analysis.csv")

# 2. Peek at the top few rows

head(adaption.innovation, 5)

# 3. Peek at the top few rows for only a few columns

adaption.innovation[1:5, 1:3]


# 4. How many rows does your data have?

nrow(adaption.innovation)

# 5. Get a summary for every column

summary(adaption.innovation)

# 6. Get a summary for one column

summary(adaption.innovation[ ,1])



# 7. Are any of the columns giving you unexpected values?
 #Yes - the first row below the header is variable information and I think it's reading it in incorrectly. 
  #Also, I think I need to rename my variables becasue it's doing odd things with the spaces.
  
# 8. Select a few key columns, make a vector of the column names

row.identifiers.for.first.test <- c(1, 2, 5, 9)


chosen.columns <- names(adaption.innovation[, row.identifiers.for.first.test]) 
names(adaption.innovation[, row.identifiers.for.first.test])
  

# 9. Create a new data.frame with just that subset of columns

subset.columns <- adaption.innovation[, row.identifiers.for.first.test]

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step

first.ten.rows <- head(subset.columns, 10)
last.ten.rows <- tail(subset.columns, 10)

head(subset.columns, 10)
tail(subset.columns, 10)
    

first.and.last <- (c(first.ten.rows, last.ten.rows))

objects(first.and.last) #this doesn't work. I don't know why. I've spent well over an hour
#trying different things. I give up.

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample

half.adaption.innovation <- (nrow(adaption.innovation)/2)

new.data.frame <- sample(adaption.innovation, half.adaption.innovation)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison

comp.difficulty.noMT <- adaption.innovation[ ,9]
comp.difficulty.staticMT <- adaption.innovation[ ,32]

summary(comp.difficulty.noMT)
summary(comp.difficulty.staticMT)

t.test(comp.difficulty.noMT, comp.difficulty.staticMT)

t.test.results1 <- t.test(comp.difficulty.noMT, comp.difficulty.staticMT)

names(adaption.innovation)
#     - decide whether you need a non-default testt.test.results1
#       (e.g., Student's, paired)

# Condition (noMT or staticMT) was manipulated within subjects, so a paired t-test is appropriate

#     - run the t.test with BOTH the formula and "vector"

t.test(comp.difficulty.noMT, comp.difficulty.staticMT, paired = TRUE)

paired.t.test.results1 <- t.test(comp.difficulty.noMT, comp.difficulty.staticMT, paired = TRUE)

#       formats, if possible
#     - if one is NOT possible, say why you can't do it

#I think I did a vector t-test, but I don't think a forumla test, at least like the one we did in 
# class would work because my other factor is not a grouping variable.

# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

trans.difficulty.noMT <- adaption.innovation[ ,3]
trans.difficulty.staticMT <- adaption.innovation[ ,15]

summary(trans.difficulty.noMT)
summary(trans.difficulty.staticMT)

t.test(trans.difficulty.noMT, trans.difficulty.staticMT)
t.test.results2 <- t.test(trans.difficulty.noMT, trans.difficulty.staticMT)

names(adaption.innovation)

t.test(trans.difficulty.noMT, trans.difficulty.staticMT, paired = TRUE)

paired.t.test.results2 <- t.test(comp.difficulty.noMT, comp.difficulty.staticMT, paired = TRUE)


trans.confidence.accuracy.noMT <- adaption.innovation[ ,4]
trans.confidence.fidelity.noMT <- adaption.innovation[ ,5]

cor(trans.confidence.accuracy.noMT, trans.confidence.fidelity.noMT)
correlation.result <- cor(trans.confidence.accuracy.noMT, trans.confidence.fidelity.noMT)

#I'm really lost as to why this isn't working. I think there is non-numeric data in the column 
#that it doesn't know what to do with, but I have no idea how to fix that.

# 14. Save all results from #12 and #13 in an .RData file

save(t.test.results1, paired.t.test.results1, t.test.results2, paired.t.test.results2, correlation.result, file = "Petras_day2_homework_results.RData")
# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link
