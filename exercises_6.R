# 1
lapply(list.files(path, pattern = ".csv"), read_csv)

# 2
dat = read.csv("olive.csv", header = FALSE)

# 3
names(dat)

# 4 
readLines("olive.csv", 1)
