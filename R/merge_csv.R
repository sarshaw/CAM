setwd("D:\\Rutgers\\PhD\\Spring-2019\\550\\Final_project\\Twitter\\Raw_data")

file_list <- list.files()

library(plyr)
dataset <- ldply(file_list, read.csv, header=TRUE, sep=",")

write.table(dataset, file = 'raw.csv', row.names = FALSE, sep = '\t', na = 'Na')

setwd("D:\\Rutgers\\PhD\\Spring-2019\\550\\Final_project\\Twitter\\final")

file_list <- list.files()

library(plyr)
dataset <- ldply(file_list, read.csv, header=TRUE, sep=",", na = "Nan")

write.table(dataset, file = 'master_raw.csv', row.names = FALSE, sep = ',', na = 'Nan')
