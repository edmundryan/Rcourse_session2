#Clear the memory
rm(list = ls())

#Set the working directory (this is where your files are stored):
setwd('C:/Work/Rcourse/Session2') 

#Import data:
my.data=read.csv('../Session1/PHACE_photosynthesis_data.csv',header=TRUE)

#Specify the columns of the csv file:
names(my.data)
Day=my.data$Day
Year=my.data$Year
GPP.ctrl=my.data$Control
GPP.eCO2=my.data$eCO2

#Define x and y values of plot:
x=Day[Year==2008]
y.ctrl=GPP.ctrl[Year==2008]
y.eCO2=GPP.eCO2[Year==2008]

#Step 1 - this is the simplest way of plotting x and y
plot(x,y.ctrl) 

#Step 2 - make it a line plot and specifying the colour of the line:
plot(x,y.ctrl,type="l",col="black")

#Step 3 - add text to title and axis labels
plot(x,y.ctrl,type="l", col="black",
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=c("Gross primary production (gC/m^2)"))

#Step 4 - properly deal with mathematical expressions within the text
plot(x,y.ctrl,type="l", col="black", 
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))

#Step 5 - widen the margins
par(mar=c(5,5,3,2))
plot(x,y.ctrl,type="l", col="black",
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))

#Step 6 - add a legend
par(mar=c(5,5,3,2))
plot(x,y.ctrl,type="l", col="black",
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))
legend(0,200,c("Control treatment"),lty=1)

#Step 7 - plot daily GPP from the elevated CO2 treatment as well.
par(mar=c(5,5,3,2))
plot(x,y.ctrl,type="l", col="black",
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))
lines(x,y.eCO2,type="l",col="red")
legend(0,200,c("Control treatment","elevated CO2"),lty=1,
       col=c("black","red"))

#Step 8 - increase the maximum value on the y-axis scale:
par(mar=c(5,5,3,2))
plot(x,y.ctrl,type="l", col="black", ylim=c(0,250),
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))
lines(x,y.eCO2,type="l",col="red")
legend(0,250,c("Control treatment","elevated CO2"),lty=1,
       col=c("black","red"))

#Step 9 - increase the thickness of the lines:
lw.set=2
par(mar=c(5,5,3,2))
plot(x,y.ctrl,type="l", col="black", ylim=c(0,250), lwd=lw.set,
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))
lines(x,y.eCO2,type="l",col="red", lwd=lw.set)
legend(0,250,c("Control treatment","elevated CO2"),lty=1, lwd=lw.set,
       col=c("black","red"))

#Step 10 - exporting the plot to a jpeg
file.name=c("DailyGPP_2008_ctrl_vs_eCO2.jpeg")
jpeg(file.name,width=1200, height=900)
lw.set=2
par(mar=c(5,5,3,2))
plot(x,y.ctrl,type="l", col="black", ylim=c(0,250), lwd=lw.set,
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production ( ",gC/m^2,"/day)",sep="")))
lines(x,y.eCO2,type="l",col="red", lwd=lw.set)
legend(0,250,c("Control treatment","elevated CO2"),lty=1, lwd=lw.set,
       col=c("black","red"))
dev.off()

#Step 11: change the font size of the text and make any final adjustments:
file.name=paste("DailyGPP_2008_ctrl_vs_eCO2.jpeg")
jpeg(file.name,width=1500, height=900)
lw.set=2
par(mar=c(6,6,6,4))
plot(x,y.ctrl,type="l", col="black", ylim=c(0,200), lwd=lw.set,
     main=c("Simulated Gross Primary Production for 2008"),
     xlab=c("Growing season day number (Day 1 = 1st March 2008)"), 
     ylab=expression(paste("Gross primary production (",gC/m^2,"/day)",sep="")),
     cex.main=3, cex.lab=2.5, cex.axis=2.5)
lines(x,y.eCO2,type="l",col="red", lwd=lw.set)
legend(0,200,c("Control treatment","elevated CO2"),lty=1, lwd=lw.set,
       col=c("black","red"),cex=2.5)
dev.off()
