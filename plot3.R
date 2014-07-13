### Read the file keeping only the two days requested
consum<- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(consum) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

## Convert columns 1 to dates and column 2 to times
consum[,1]<-as.Date(consum[,1], format="%d/%m/%Y")
as.Date(paste(consum[2,1],consum[2,2]))

consum[10]<-1:2880

## Draw the plot
par(mfcol = c(1, 1))
par(xaxt="n")
with(consum, plot(V10,Sub_metering_1, type ="l", xlab="",ylab="Energy sub metering"))
with(consum, lines(V10,Sub_metering_2, type ="l", xlab="",col="red"))
with(consum, lines(V10,Sub_metering_3, type ="l", xlab="",col="blue"))
par(xaxt="s")
axis(1, at=c(1,nrow(consum)/2,nrow(consum)),labels=c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), text.width=1000, col=c("black","red","blue" ),lwd=2)

## Save the graphic to a png file
dev.copy(png, file = "plot3.png") 
dev.off()