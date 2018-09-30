datafile <- 'household_power_consumption.txt'
header <- read.table(datafile, nrows = 1, sep = ';', stringsAsFactors = FALSE)
dat <- read.table(datafile, skip = 66637, nrows = 2880, sep = ';', stringsAsFactors = FALSE, na.strings = '?')
colnames(dat) <- unlist(header)
dat$Time <- strptime(paste(dat$Date, dat$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')
dat$Date <- as.Date(dat$Date, format = '%d/%m/%Y')

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(dat, plot(Time, Global_active_power, type='l', xlab = '', ylab = 'Global Active Power'))
with(dat, plot(Time, Voltage, type='l', xlab = 'datetime'))

with(dat, {
  plot(dat$Time, dat$Sub_metering_1, type = 'n', ylab = 'Energy sub metering', xlab = '')
  points(dat$Time, dat$Sub_metering_1, col='black', type = 'l')
  points(dat$Time, dat$Sub_metering_2, col='red', type = 'l')
  points(dat$Time, dat$Sub_metering_3, col='blue', type = 'l')
  legend("topright", lty = 1, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n', cex = 0.75)
})
with(dat, plot(Time, Global_reactive_power, type='l', xlab = 'datetime'))

dev.copy(png, file = 'plot4.png', width = 480, height = 480)
dev.off()