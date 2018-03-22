setwd("") #ruta de tu directorio de trabajo

install.packages("dismo")
install.packages("raster")


library(dismo)
library(raster)

#"prec" corresponde al nombre de la carpeta que tiene los 12 asci de precipitación

stfiles=list.files("prec",pattern = "*.asc$", full.name=T) 
prec=stack(stfiles)

stfiles=list.files("tmax", pattern = "*.asc$", full.name=T)
tmax=stack(stfiles)

stfiles=list.files("tmin",pattern = "*.asc$", full.name=T)
tmin=stack(stfiles)

dir.create("bios") #crea una carpeta en mi ruta de trabajo
bio <-biovars(prec, tmin, tmax) 
writeRaster(bio, filename="bios/.asc", overwrite=TRUE, bylayer=TRUE, suffix='names')

plot(bio[[1]])

