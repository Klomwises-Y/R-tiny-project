library(ggplot2)
library(maps)
library(ggthemes)
library(dplyr)


Country = "Netherlands"
Year = 2001

sample_df = data.frame(Country, Year)

map_data <- map_data("world")
country_data <- subset(map_data, region == sample_df$Country)

sample_df= sample_df %>% 
  mutate(longitude = mean(country_data$long),  
                      latitude= mean(country_data$lat))

mapplot=ggplot() +
  geom_map(
    data = map_data, map = map_data,
    aes(long, lat, map_id = region),
    color = "wheat3",fill = "white"
  )
mapplot

map_with_point = mapplot + 
geom_point(
  data = sample_df,
  aes(longitude, latitude), 
  color = "blue",size= 2
) 
map_with_point


map_with_countryname = map_with_point +
  geom_text(data = sample_df, 
          label= Country,
          aes(longitude, latitude), 
          hjust=-0.15, vjust=-1, size=3, color="deeppink4",fontface='bold') 
map_with_countryname





  

