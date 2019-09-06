library(ggplot2)

summary(diamonds)

summary(diamonds$price)

aveSize <- round(mean(diamonds$carat), 4)
clarity <- levels(diamonds$clarity)

p <- qplot(carat, price, data = diamonds, color = clarity) + labs(x = "Carat", y = "Price") + labs(title = "Diamond Pricing")

p + theme(plot.title = element_text(size = 24))