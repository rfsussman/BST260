## 6.2
# 1
murders_dt[, rate := total/population*10^5]

# 2
murders_dt[, rank := rank(-rate)]

# 3
murders_dt[, .(state, abb)]

# 4
murders_dt[rank <= 5]

# 5
no_south = murders_dt[region != "South"]
nrow(no_south)

# 6
murders_nw = murders_dt[region %in% c("Northeast", "West")]

# 7
my_states = murders_dt[region %in% c("Northeast", "West") & rate < 1, .(state, rate, rank)]

## 6.5
library(NHANES)
n_dt = as.data.table(NHANES)  

# 1
n_dt[Gender == "female" & AgeDecade == " 20-29", .(avg = mean(BPSysAve, na.rm = TRUE), sd = sd(BPSysAve, na.rm = TRUE))]

# 2
n_dt[Gender == "female" & AgeDecade == " 20-29", .(min = min(BPSysAve, na.rm = TRUE), max = max(BPSysAve, na.rm = TRUE))]

# 3
n_dt[Gender == "female", .(avg = mean(BPSysAve, na.rm = TRUE), sd = sd(BPSysAve, na.rm = TRUE)), by = AgeDecade]

# 4
n_dt[Gender == "male", .(avg = mean(BPSysAve, na.rm = TRUE), sd = sd(BPSysAve, na.rm = TRUE)), by = AgeDecade]

# 5
n_dt_summary = n_dt[Gender == "male" & AgeDecade == " 40-49", .(avg = mean(BPSysAve, na.rm = TRUE), sd = sd(BPSysAve, na.rm = TRUE)), by = Race1]
n_dt_summary[order(-avg)]

