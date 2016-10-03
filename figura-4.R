library(lubridate);

#Función que ayuda en el tratamiento de fechas (date/timestamp).
second_day <- function(x){
  s <- hour(x)*3600+minute(x)*60+second(x)
}

weekend_weekday <- function(x){
  val <- weekdays(x)
  if (val=="Saturday" | val=="Sunday") {
    val2 = "Fin de Semana"
  }
  else {
    val2= "Semana"
  }
  return(val2)
}

web <- "https://www.dropbox.com/s/r0fxlta0tyqkwax/datatraining.txt?dl=1";
datatraining <- read.table(web, sep=",", quote="\"");

datatraining$date <- as.POSIXct(datatraining$date,tz="UTC");

datatraining$NSM <- second_day(datatraining$date);

#Se agrega etiqueta de Semana/Fin de Semana.
datatraining$WeekStatus <-unlist(lapply(datatraining$date,weekend_weekday));

#Se convierte a factor.
datatraining$WeekStatus <-as.factor(datatraining$WeekStatus);

datatraining$Occupancy <- as.factor(datatraining$Occupancy);

#Se crea gráfico.
cols2 <- character(nrow(datatraining));
cols2[] <- "black";
cols2[datatraining$Occupancy %in% c("0")] <- "green";
cols2[datatraining$Occupancy %in% c("1")] <- "blue";

print(pairs(datatraining[c(2,3,4,5,6,8,9)], col=cols2, cex=1.1, cex.labels=1.5));

#Se abre archivo de imagen.
png(file="Figura-4.png",width=1280,height=1200);

print(pairs(datatraining[c(2,3,4,5,6,8,9)], col=cols2, cex=1.1, cex.labels=1.5));

#Se cierra archivo.
dev.off()