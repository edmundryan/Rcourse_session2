#Clear the memory
rm(list = ls())

#Set the working directory (this is the directory where your files for session 2 are stored):
setwd('C:/Work/Rcourse/Session2') 

#Import data:
my.data=read.csv('../Session1/PHACE_photosynthesis_data.csv',header=TRUE)

#Specify the columns of the csv file:
names(my.data)
Day=my.data$Day
Year=my.data$Year
GPP.ctrl=my.data$Control
GPP.eCO2=my.data$eCO2
GPP.temp=my.data$Heating
GPP.eCO2temp=my.data$Heating_eCO2

#Exporting the plot to a jpeg file:
file.name=paste("DailyGPP_ctrl_vs_othertreatments.jpeg")
jpeg(file.name,width=1500, height=900)

#specify the number and layout of the subplots:
par(mfrow=c(2,2))

#First subplot
par(mar=c(4,6,8,4))
plot(GPP.ctrl,GPP.eCO2,type="p", col="darkgoldenrod4", pch=4, lwd=2, cex=1.5,
     xlab=expression(paste("GPP for control (gC/",m^2,"/day)"),sep=""),
     ylab=expression(paste("GPP for elevated CO"[2]*" (gC/",m^2,"/day)"),sep=""),
     cex.lab=2, cex.axis=2, xlim=c(0,250), ylim=c(0,250))
title(expression(paste("Daily GPP (control vs elevated CO"[2]*")",sep="")),line=1.5,cex.main=3)
lines(c(0,250),c(0,250),type="l",col="red",lwd=3,lty=2)

#Second subplot
par(mar=c(4,6,8,4))
plot(GPP.ctrl,GPP.temp,type="p", col="blue", pch=4, lwd=2, cex=1.5,
     xlab=expression(paste("GPP for control (gC/",m^2,"/day)"),sep=""),
     ylab=expression(paste("GPP for elevated warming (gC/",m^2,"/day)"),sep=""),
     cex.lab=2, cex.axis=2, xlim=c(0,250), ylim=c(0,250))
title(expression(paste("Daily GPP (control vs warming)",sep="")),line=1.5,cex.main=3)
lines(c(0,250),c(0,250),type="l",col="red",lwd=3,lty=2)

#Third subplot
par(mar=c(4,6,8,4))
plot(GPP.ctrl,GPP.eCO2temp,type="p", col="dark green", pch=4, lwd=2, cex=1.5,
     xlab=expression(paste("GPP for control (gC/",m^2,"/day)"),sep=""),
     ylab=expression(paste("GPP for elevated CO"[2]*"+warming (gC/",m^2,"/day)"),sep=""),
     cex.lab=2, cex.axis=2, xlim=c(0,250), ylim=c(0,250))
title(expression(paste("Daily GPP (control vs elevated CO"[2]*" & warming)",sep="")),line=1.5,cex.main=3)
lines(c(0,250),c(0,250),type="l",col="red",lwd=3,lty=2)

#Four subplot
par(mar=c(4,6,8,4))
RowID=c(1:dim(my.data)[1])
RowID.noNA=RowID[is.na(GPP.ctrl)==FALSE]  #remove the rows with NAs
GPP.sum = apply(my.data[RowID.noNA,3:6],2,sum)
barplot(GPP.sum,names.arg=c("Control",expression("eCO"[2]),"Warming",expression("eCO"[2]* " and warming")),
        col=c("grey","darkgoldenrod4","blue","dark green"), 
        ylab=expression(paste("6-year GPP (gC/",m^2,"/day)"),sep=""),
        cex.names=2,cex.lab=2, cex.axis=2)
title(expression(paste("6 year GPP for all four treatments)",sep="")),line=1.5,cex.main=3)
#title("6-year GPP for all four treatments",line=1.5,cex.main=3)

#Main title
mtext(text="Gross primary production (GPP) on daily scale (panels 1-3) and six-year scale (panel 4)",
      side=3,line=-3,outer=TRUE,cex=3)

#Close the plot
dev.off()
