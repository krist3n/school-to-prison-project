#import ggplot2
library(ggplot2)
#read in data
setwd("~/Desktop/BxD/ed_data")
student_discipline <- read.csv("student-discipline-2022-2023.xlsx - Annual Report--R-P-S TOTALS.csv")
nypd_contact <- read.csv("nypd-contacts-2022-2023.xlsx - NYPD-SUSP--RACE.csv")
#convert chr values to num
student_discipline$TOTAL.REMOVALS.SUSPENSIONS = sub("#N/A", "0", student_discipline$TOTAL.REMOVALS.SUSPENSIONS)
student_discipline$TOTAL.REMOVALS.SUSPENSIONS = as.numeric(student_discipline$TOTAL.REMOVALS.SUSPENSIONS)
nypd_contact$TOTAL.REMOVALS.SUSPENSIONS.Where.NYPD.Was.Contacted = sub("#N/A", "0", nypd_contact$TOTAL.REMOVALS.SUSPENSIONS.Where.NYPD.Was.Contacted)
nypd_contact$TOTAL.REMOVALS.SUSPENSIONS.Where.NYPD.Was.Contacted = as.numeric(nypd_contact$TOTAL.REMOVALS.SUSPENSIONS.Where.NYPD.Was.Contacted)
#create data frame of counts
sd_counts <- data.frame(student_discipline$TOTAL.REMOVALS.SUSPENSIONS, student_discipline$Borough)
sd_counts <- subset(sd_counts, student_discipline.TOTAL.REMOVALS.SUSPENSIONS < 36992)
nypd_counts <- data.frame(nypd_contact$TOTAL.REMOVALS.SUSPENSIONS.Where.NYPD.Was.Contacted, nypd_contact$Borough)
nypd_counts <- subset(nypd_counts, nypd_contact.TOTAL.REMOVALS.SUSPENSIONS.Where.NYPD.Was.Contacted < 2255)
#boxplot of student_discipline
ggplot(sd_counts, mapping=aes(x=student_discipline.TOTAL.REMOVALS.SUSPENSIONS, y=student_discipline.Borough))+geom_boxplot(fill='lightsteelblue')+ labs(y = "Borough", x = "Total Removals/Suspensions") + coord_cartesian(xlim =  c(0, 100))