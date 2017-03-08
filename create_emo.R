
#Marja Eliisa Holm, marja.hytonen@helsinki.fi, 8.3.2017
#this is create-emo file for final task including items 
#and scales relating to class-related emotions

#----------------------------------------------------------------------------
#First, we read the spss data ("ec.dav") of the class-related emotions into R
library(foreign)

ec <- read.spss(file.choose("ec.sav"), to.data.frame=TRUE)

# We look at the summary and dimensions of the data
summary(ec)
dim(ec)

# We first have 1412 observations and 20 items related to class-related emotions in this data 
#-----------------------------------------------------------------------------------
 
# Second, we create the six scale relating class-related emotions based on the mean of the items
library(dplyr)

#We create class-related enjoyment including items EMO1, EMO5, EMO8 and EMO12
JOC <- c("EMO1", "EMO5", "EMO8", "EMO12")
# We select the columns related to class enjoyment and
#create column 'JOC' by averaging
JOC_columns <- select(ec, one_of(JOC))
ec$JOC <- rowMeans(JOC_columns)

# We create class-related pride including items EMO18 and EMO19
PRC <- c("EMO18", "EMO19")
# We select the columns related to class pride and
#create column 'PRC' by averaging
PRC_columns <- select(ec, one_of(PRC))
ec$PRC <- rowMeans(PRC_columns)


# We create class-related anger including items EMO9, EMO13, EMO15 and EMO17
AGC <- c("EMO9", "EMO13", "EMO15", "EMO17")
# We select the columns related to class anger and
#create column 'AGC' by averaging
AGC_columns <- select(ec, one_of(AGC))
ec$AGC <- rowMeans(AGC_columns)

#We create class related anxiety including items EMO2, EMO7, EMO3 and EMO4
AXC <- c("EMO2", "EMO7", "EMO3", "EMO4")
# We select the columns related to class anxiety and
#create column 'AXC' by averaging
AXC_columns <- select(ec, one_of(AXC))
ec$AXC <- rowMeans(AXC_columns)


#We create class related shame including items EMO10, EMO50, EMO16 
SHC <- c("EMO10", "EMO50", "EMO16")
# We select the columns related to class shame and
#create column 'SHC' by averaging
SHC_columns <- select(ec, one_of(SHC))
ec$SHC <- rowMeans(SHC_columns)

#We create class related shame including items EMO11, EMO6, EMO14 
BOC <- c("EMO11", "EMO6", "EMO14")
# We select the columns related to class boredom and
#create column 'BOC' by averaging
BOC_columns <- select(ec, one_of(BOC))
ec$BOC <- rowMeans(BOC_columns)

#Now, the data have 1412 observations and 26 variables
dim(ec)
summary(ec)

#---------------------------------------------------------------
#We convert two positive emotions (pride and enjoyment) of the same scale 
#than negative emotions by turning (Likert scale 1 to 5).
ec$JOC<- 6-ec$JOC
ec$PRC<- 6-ec$PRC
summary(ec)

#---------------------------------------------------------------------------
##Finally, we save the R.file into csv format. 
write.table(ec, file="ec.csv")

#We also check that csv file can be read and same dimensions are present 
ec<-read.table("ec.csv")
dim(ec)
head(ec)