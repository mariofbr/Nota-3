web <- "https://www.dropbox.com/s/r0fxlta0tyqkwax/datatraining.txt?dl=1";
datatraining <- read.table(web, sep=",", quote="\"");

str(datatraining);

datatraining$Occupancy <- as.factor(datatraining$Occupancy);

datatraining$date <- as.POSIXct(datatraining$date,tz="UTC");

datatraining$Occupancy <- as.factor(datatraining$Occupancy);

str(datatraining);

prop.table(table(datatraining$Occupancy));

library(ggplot2);
library(grid);
library(scales);

#Gráfico 1, se cambia rango de fecha para usar archivo en Internet.

myplot1 <- ggplot(datatraining,aes(date))+geom_line(color="Red",aes(y=Temperature))+ylab("Temperatura")+xlab("Hora")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-09 8:00","2015-02-10 7:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1));

#Gráfico 2, se cambia rango de fecha para usar archivo en Internet.

myplot2 <- ggplot(datatraining,aes(date))+geom_line(color="Blue",aes(y=Humidity))+ylab("Humedad")+xlab("Hora")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-09 8:00","2015-02-10 7:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1));

#Gráfico 3, se cambia rango de fecha para usar archivo en Internet.

myplot3 <- ggplot(datatraining,aes(date))+geom_line(color="deepskyblue1",aes(y=HumidityRatio))+ylab("Radio de Humedad")+xlab("Hora")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-09 8:00","2015-02-10 7:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1)); 

#Gráfico 4, se cambia rango de fecha para usar archivo en Internet.

myplot4 <- ggplot(datatraining,aes(date))+geom_line(color="Green",aes(y=CO2))+ylab("CO2 (ppm)")+xlab("Hora")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-09 8:00","2015-02-10 7:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1)); 

#Gráfico 5, se cambia rango de fecha para usar archivo en Internet.

myplot5 <- ggplot(datatraining,aes(date))+geom_line(color="gold4",aes(y=Light))+ylab("Luz")+xlab("Hora")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-09 8:00","2015-02-10 7:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1));

#Gráfico 6, se cambia rango de fecha para usar archivo en Internet.

myplot6 <- ggplot(datatraining,aes(date))+geom_line(color="Black",aes(y=as.numeric(Occupancy)))+ylab("Ocupación")+xlab("Hora")+
  scale_x_datetime(breaks=date_breaks("60 min"),labels=date_format("%H:%M"),
                   limits=as.POSIXct(c("2015-02-09 8:00","2015-02-10 7:00"),tz="GMT"))+
  theme(axis.text.x=element_text(angle=90,hjust=1));

#Se crea una vista para mostrar los 6 gráficos juntos.

pushViewport(viewport(layout=grid.layout(6,1)));

#Se muestran los gráficos, indicando su posición dentro del viewport.

print(myplot1, vp=viewport(layout.pos.row=1, layout.pos.col=1));
print(myplot2, vp=viewport(layout.pos.row=2, layout.pos.col=1));
print(myplot3, vp=viewport(layout.pos.row=3, layout.pos.col=1));
print(myplot4, vp=viewport(layout.pos.row=4, layout.pos.col=1));
print(myplot5, vp=viewport(layout.pos.row=5, layout.pos.col=1));
print(myplot6, vp=viewport(layout.pos.row=6, layout.pos.col=1));

#Se abre archivo de imagen.
png(file="Figura-3.png",width=1280,height=1200);

#Se crea una vista para mostrar los 6 gráficos juntos.

pushViewport(viewport(layout=grid.layout(6,1)));

#Se muestran los gráficos, indicando su posición dentro del viewport.

print(myplot1, vp=viewport(layout.pos.row=1, layout.pos.col=1));
print(myplot2, vp=viewport(layout.pos.row=2, layout.pos.col=1));
print(myplot3, vp=viewport(layout.pos.row=3, layout.pos.col=1));
print(myplot4, vp=viewport(layout.pos.row=4, layout.pos.col=1));
print(myplot5, vp=viewport(layout.pos.row=5, layout.pos.col=1));
print(myplot6, vp=viewport(layout.pos.row=6, layout.pos.col=1));

#Se cierra archivo.
dev.off()