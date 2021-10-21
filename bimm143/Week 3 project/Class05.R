#Class 05 Data visualization

# lets start with a scatterplot
# Before we use it we need to load it up!

library(ggplot2)
ggplot(cars)

# Every ggplot has a data + aes +geoms
ggplot(data=cars) +
  aes(x=speed, y=dist) + 
  geom_point()+
  geom_smooth()

#Change to a linear model
p <- ggplot(data=cars) +
  aes(x=speed, y=dist) + 
  geom_point()+
  geom_smooth(method ="lm")

p+labs(title = "My nice plot",x="Speed (MPH)", y="Distance")

#Base graphics is shorter
plot(cars)

#Genes graph practice
genes <- read.delim("https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt")
head(genes)

# Q. How many genes
nrow(genes)

colnames(genes)
ncol(genes)

# Q. how to access State col
table(genes$State)

# What % up/down (rounded)
round(table(genes$State)/nrow(genes)*100,2)

# Genes plot
g <- ggplot(genes) + aes(x= Condition1, y=Condition2, col=State) + geom_point()

# Changing the colors
g + scale_colour_manual(values=c("blue","gray","purple"))
labs(title= "Gene Expression Changes Upon Drug Treatment",
     x="Control (no drug", y="Dog Treatment")

# Add titles
g + scale_colour_manual(values=c("blue","gray","purple")) + labs(title= "Gene Expression Changes Upon Drug Treatment", x="Control(no drug)", y="Drug Treatment")
