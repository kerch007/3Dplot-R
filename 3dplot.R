

library(ggplot2)
library(plotly)
data <-read.table("outline_coordinates.csv", sep = ",", header = F )
colnames(data) <- c("x","y","z")
cell_coordinates <- read.table("cell_coordinates.csv", sep = ",", header = F ) 
colnames(cell_coordinates) <- c("x","y","z","color")
cell_coordinates$color <- as.factor(cell_coordinates$color)

p1 <-plot_ly(data, x=~x,y=~y,z=~z, type='mesh3d',opacity = 0.3, alphahull = 0, intensity = seq(0,1,length=8),
             colorscale = list(
               c(0, 'rgb(255, 0, 255)'),
               c(0.5, 'rgb(0, 255, 0)'),
               c(1, 'rgb(0, 0, 255)') ),showscale = F)


p2 <-plot_ly(cell_coordinates, x = ~x, y = ~y, z = ~z, color = ~color,size = 10, 
             symbol = 'circle' ,showlegend = F,
             colors = c(
               rgb(0, 255, 0,max=255),
               rgb(95, 175, 0,max=255),          
               rgb(175, 95, 175,max=255),
               rgb(0, 255, 255,max=255),
               rgb(0, 215, 215,max=255),
               rgb(255, 0, 175,max=255),
               rgb(128, 128, 0, m=255)))


subplot(p1,p2)


