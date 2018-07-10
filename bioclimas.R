install.packages("dismo")
install.packages("raster")

library(dismo)

#"prec", "tmax" y "tmin" son carpetas con los raster mensuales de cada variable
# por ejemplo las que se descargan de esta pagina http://idrisi.uaemex.mx/distribucion/superficies-climaticas-para-mexico

prec<-stack(list.files("prec",pattern = "*.tif$", full.name=T)) 
tmax<-stack(list.files("tmax", pattern = "*.tif$", full.name=T))
tmin<-stack(list.files("tmin",pattern = "*.tif$", full.name=T))

dir.create("bios") #crea una carpeta en mi ruta de trabajo
bio <-biovars(prec, tmin, tmax) 
writeRaster(bio, filename="bios/.asc", overwrite=TRUE, bylayer=TRUE, suffix='names')

plot(bio[[1]])

