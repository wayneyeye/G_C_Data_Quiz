download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = "./q1.csv")
q1_Data<-read.csv(file = "./q1.csv")
head(q1_Data)
strsplit(names(q1_Data),split = "wgtp")


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ",destfile = "./q2.csv")
q2_Data<-read.csv(file = "./q2.csv")
q2_Data<-q2_Data[5:nrow(q2_Data),]
(q2_Data)
str(q2_Data$X.3)
q2_Data$X.3<-as.character(q2_Data$X.3)
q2_Data$X.3<-gsub(",","",q2_Data$X.3)
q2_Data$X.3<-trim(q2_Data$X.3)
q2_Data$X.3<-as.numeric(q2_Data$X.3)
q2_Data<-q2_Data[1:190,]
mean(q2_Data$X.3)
mean(c(NA,1,2,3),na.rm = T)
grep("^United",q2_Data$X.2)


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ",destfile = "./q3_1.csv")
q3_1_Data<-read.csv(file = "./q3_1.csv",skip = 4)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv ",destfile = "./q3_2.csv")
q3_2_Data<-read.csv(file = "./q3_2.csv")
q3_Data<-merge(x=q3_2_Data,y=q3_1_Data,by.y = "X",by.x = "CountryCode")
table(grepl("Fiscal year end: June",q3_Data$Special.Notes))

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

head(sampleTimes)
str(sampleTimes)
table(weekdays(sampleTimes,abbreviate = T)=="Mon"&grepl("^2012",as.character(sampleTimes)))
table(grepl("^2012",as.character(sampleTimes)))
