library(maps)
library(ggplot2)
library(RColorBrewer)

#####################

states_map <- map_data("state")
ggplot(states_map, aes(x=long,y=lat,group=group)) + geom_polygon(fill="white",colour="black")
ggplot(states_map, aes(x=long,y=lat,group=group)) + geom_path + coord_map("mercator")

#####################

world_map <- map_data("world")
head(world_map)

#####################

east_asia <- map_data("world",region=c("Japan","China","North Korea","South Korea"))
ggplot(east_asia, aes(x=long,y=lat,group=group,fill=region)) + 
geom_polygon(colours="black")+
scale_fill_brewer(palette="Set2")

#Other Palettes : Accent,Paired, Set1

####################
IrlSet <- grep("Irel",world_map$region)
# IrlMap <- world_map[IrlSet,]
Ireland <- map_data("world",region=c("Ireland"))
ggplot(Ireland , aes(x=long,y=lat,group=group,fill=region)) + 
geom_polygon(colours="black")+
scale_fill_brewer(palette="Set2")
 # Not Great !
###################

NWE <- map_data("world",region=c("Portugal","Ireland","Italy","Greece","Spain"))
ggplot(NWE , aes(x=long,y=lat,group=group,fill=region)) + 
geom_polygon(colours="black")+
scale_fill_brewer(palette="Set1")


NZ1 <- map_data("world",region="New Zealand")
NZ1 <- subset(NZ1, long>0 &lat> -48)  #trim off outlying islands
ggplot(NZ1,aes(x=long,y=lat,group=group)) + geom_path()

NZ2 <- map_data("nz")
ggplot(NZ2,aes(x=long,y=lat,group=group)) + geom_path()

###################

crimes <-data.frame(state =tolower(rownames(USArrests)),USArrests)
head(crimes)
