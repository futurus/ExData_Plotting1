par(mfrow = c(2, 2))
# top left
plot(data$Global_active_power, type = "l", axes = F, xlab="", ylab = "Global Active Power")
axis(1, at = c(1, nrow(data)/2+1, nrow(data)+1), labels=F)
text(y=par('usr')[3]-(par('usr')[4]-par('usr')[3])/7, x = c(1, nrow(data)/2+1, nrow(data)+1), labels = c("Thu", "Fri", "Sat"), xpd=T)
axis(2)
box()

# top right
plot(data$Voltage, type = "l", axes = F, xlab="datetime", ylab = "Voltage")
axis(1, at = c(1, nrow(data)/2+1, nrow(data)+1), labels=F)
text(y=par('usr')[3]-(par('usr')[4]-par('usr')[3])/7, x = c(1, nrow(data)/2+1, nrow(data)+1), labels = c("Thu", "Fri", "Sat"), xpd=T)
axis(2)
box()

# lower left
matplot(data[ , 7:9], type = "l", axes = F, xlab="", ylab = "Energy sub metering", col=c("black", "red", "blue"))
axis(1, at = c(1, nrow(data)/2+1, nrow(data)+1), labels=F)
text(y=par('usr')[3]-(par('usr')[4]-par('usr')[3])/7, x = c(1, nrow(data)/2+1, nrow(data)+1), labels = c("Thu", "Fri", "Sat"), xpd=T)
axis(2)
box()
legend("topright", legend=colnames(data)[7:9], border=NA, lwd=1, col=c("black", "red", "blue"), cex=0.75, box.lwd = 0)

# lower right
plot(data$Global_reactive_pwer, type = "l", axes = F, xlab="datetime", ylab="Global_reactive_power")
axis(1, at = c(1, nrow(data)/2+1, nrow(data)+1), labels=F)
text(y=par('usr')[3]-(par('usr')[4]-par('usr')[3])/7, x = c(1, nrow(data)/2+1, nrow(data)+1), labels = c("Thu", "Fri", "Sat"), xpd=T)
axis(2)
box()

dev.copy(png, "plot4.png")
dev.off()