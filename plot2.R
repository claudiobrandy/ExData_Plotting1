## Read the file keeping only the two days requested
consum<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(consum) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Convert columns 1 to dates and column 2 to times
consum[,1]<-as.Date(consum[,1], format="%d/%m/%Y")
as.Date(paste(consum[2,1],consum[2,2]))

consum[10]<-1:2880

## Draw the plot
par(mfcol = c(1, 1))
par(xaxt="n")
with(consum, plot(V10, Global_active_power, type ="l",xlab="",ylab="Global Active Power (kilowatts)"))
par(xaxt="s")
axis(1, at=c(1,nrow(consum)/2,nrow(consum)),labels=c("Thu","Fri","Sat"))

## Save the graphic to a png file
dev.copy(png, file = "plot2.png") 
dev.off()