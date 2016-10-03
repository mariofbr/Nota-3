data <- read.table("Tabla3.txt", header=TRUE,sep=",");

#Se convierten en valores númericos.
data$Temperature<- as.numeric(data$Temperature);
data$Humidity<- as.numeric(data$Humidity);
data$Light<- as.numeric(data$Light);
data$CO2<- as.numeric(data$CO2);
data$HumidityRatio<- as.numeric(data$HumidityRatio);
data$NSM<- as.numeric(data$NSM);
data$WS<- as.numeric(data$WS);

#Se convierte en matriz.
data <- as.matrix(data);

library(corrplot);

#Se crea gráfico.
corrplot(data,type="upper", order="hclust", tl.col="black", tl.srt=45);

#Se abre archivo de imagen.
png(file="Figura-5.png",width=1280,height=1200);

#Se crea gráfico.
corrplot(data,type="upper", order="hclust", tl.col="black", tl.srt=45);

dev.off()