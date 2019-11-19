Page 305

# Another possible set of splitting directions
mosaic( ~ Dept + Gender + Admit, data=UCBAdmissions,
 highlighting="Admit", highlighting_fill=c("lightblue", "pink"),
 direction=c("v", "v", "h"))
# This order makes it difficult to compare male and female
mosaic( ~ Dept + Gender + Admit, data=UCBAdmissions,
 highlighting="Admit", highlighting_fill=c("lightblue", "pink"),
 direction=c("v", "h", "h"))


##########################################

## Creating Maps

library(maps) # For map data

# Get map data for USA

states_map <- map_data("state")
ggplot(states_map, aes(x=long, y=lat, group=group)) +
 geom_polygon(fill="white", colour="black")

# geom_path (no fill) and Mercator projection

ggplot(states_map, aes(x=long, y=lat, group=group)) +
 geom_path() + coord_map("mercator")

###########################################

## Page 314

ggplot(crimes, aes(map_id = state, fill=Assault)) +
 geom_map(map = states_map, colour="black") +
 scale_fill_gradient2(low="#559999", mid="grey90", high="#BB650B",
 midpoint=median(crimes$Assault)) +
 expand_limits(x = states_map$long, y = states_map$lat) +
 coord_map("polyconic")

###########################################

## Page 316

## The 'state' column in the crimes data is to be matched 
## to the 'region' column in the states_map data

ggplot(crimes, aes(map_id = state, fill=Assault)) +
 geom_map(map = states_map) +
 expand_limits(x = states_map$long, y = states_map$lat) +
 coord_map("polyconic")


###########################################

## Page 318 choropleths 
ggplot(crimes, aes(map_id = state, fill=Assault_q)) +
 geom_map(map = states_map, colour="black") +
 scale_fill_manual(values=pal) +
 expand_limits(x = states_map$long, y = states_map$lat) +
 coord_map("polyconic") +
 labs(fill="Assault Rate\nPercentile") +
 theme_clean()


###########################################

## Page 319 
## Creating a Map from a Shapefile
## create a geographical map from an Esri shapefile.

## Load the shapefile using readShapePoly() from the maptools package, 
## convert it to a data frame with fortify()
## then plot it (Figure 13-39):

library(maptools)
# Load the shapefile and convert to a data frame
taiwan_shp <- readShapePoly("TWN_adm/TWN_adm2.shp")
taiwan_map <- fortify(taiwan_shp)
ggplot(taiwan_map, aes(x = long, y = lat, group=group)) + geom_path()



###########################################
