## Read the file keeping only the two days requested
consum<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(consum) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Draw the histogram
par(mfcol = c(1, 1))
hist(consum$Global_active_power, col ="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Save the graphic to a png file
dev.copy(png, file = "plot1.png") 
dev.off()