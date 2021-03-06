datafile <- 'household_power_consumption.txt'
header <- read.table(datafile, nrows = 1, sep = ';', stringsAsFactors = FALSE)
dat <- read.table(datafile, skip = 66637, nrows = 2880, sep = ';', stringsAsFactors = FALSE, na.strings = '?')
colnames(dat) <- unlist(header)
dat$Time <- strptime(paste(dat$Date, dat$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')
dat$Date <- as.Date(dat$Date, format = '%d/%m/%Y')

hist(dat$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.copy(png, file = 'plot1.png', width = 480, height = 480)
dev.off()