library(ggplot2)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, geom = c("point","smooth"), color = drv)
qplot(displ, hwy, data = mpg, color = drv) + geom_smooth(method = "lm")

qplot(hwy, data = mpg, fill = drv)

qplot(displ, hwy, data = mpg, facets = . ~ drv)
qplot(displ, hwy, data = mpg, facets = . ~ drv, color = drv)

#Gqplot
g <- ggplot(mpg, aes(displ,hwy)) + geom_point(aes(color = drv)) + facet_grid(. ~ drv) + geom_smooth(method = "lm")
g + labs(title =" Titulo") + theme_gray(base_family = "Helvetica")

qplot(drv, hwy, data = mpg, geom = "boxplot", color = manufacturer)

qplot(displ, hwy, data = mpg, color = drv, geom = c("point","smooth"))

qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg, facets = drv ~., binwidth = 2)
g + geom_point(color = "pink", size = 4, alpha = 1/2)
g + geom_point(size = 4, alpha = 1/2, aes(color = drv))

g + geom_point() + facet_grid(drv~cyl, margins = TRUE) + geom_smooth(method = "lm", se = FALSE, size = 2, color = "black") + labs(x="Displacement", y ="Highway Mileage", title = "Swirl Rules!")

qplot(price, data = diamonds, binwidth = 18497/30, fill = cut)
qplot(price, data = diamonds, geom="density")
qplot(price, data = diamonds, geom="density", color = cut)
qplot(carat, price, data = diamonds, color = cut)
qplot(carat, price, data = diamonds, color = cut) + geom_smooth(method = "lm")
qplot(carat, price, data = diamonds, color = cut, facets = .~cut) + geom_smooth(method = "lm") 

cutpoints <- quantile(diamonds$carat, seq(0,1, length = 4), na.rm =TRUE)
diamonds$car2 <- cut(diamonds$carat, cutpoints)
g <- ggplot(data = diamonds, aes(depth, price))
g + geom_point(alpha = 1/3) + facet_grid(cut ~car2)

g + geom_point(alpha = 1/3) + facet_grid(cut ~car2) + geom_smooth(method = "lm", size = 3, color = "pink")
ggplot(diamonds, aes(carat, price)) + geom_boxplot() + facet_grid(.~cut)
