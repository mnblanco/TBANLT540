	library(readr)
	library("ggplot2")
	cpsa2016_cpsaat03_clean <- read_delim("~/R/cpsa2016_cpsaat03_clean.csv", 
	                                      "\t", escape_double = FALSE, trim_ws = TRUE)
	View(cpsa2016_cpsaat03_clean)
	
	# Summary Statistics
	summary(cpsa2016_cpsaat03_clean)
	
	# Scatter Plot of Age and Civilian Labor Force by Percent of Population
	ggplot(data=cpsa2016_cpsaat03_clean, aes(x=Age, y=CLF.Pct)) +
	  geom_point() + 
	  theme(axis.text.x=element_text(angle=90,hjust=1)) +
	  ggtitle("Age vs. Civilian Labor Force by Percent of Population") +
	  labs(x = "Age", y ="Civilian Labor Force Percent") 

	# Bar Chart of Civilian Labor Force Total with labels by Age
	ggplot(data=cpsa2016_cpsaat03_clean, aes(x=Age, y=CLF.Total)) + 
	  geom_bar(stat="identity") + 
	  theme(axis.text.x=element_text(angle=90,hjust=1)) +
	  ggtitle("Civilian Labor Force Total by Age") +
	  labs(x = "Age", y ="Civilian Labor Force Total")
	
	# Scatter Plot of Civilian Labor Force (Percent), Age, and Civilian Labor Force (Employed) 
	ggplot(cpsa2016_cpsaat03_clean, aes(x = Age, y = CLF.Total, col = CLF.Pct)) +
	  geom_point(size=2) + scale_color_gradient(low="lightpink",high = "darkred") +
	  theme(axis.text.x=element_text(angle=90,hjust=1)) +
	  ggtitle("Age vs. Civilian Labor Force Total") +
	  labs(x = "Age", y ="Civilian Labor Force Total")
	
	  
	# Scatter Plot of Percent of Population Not in Labor Force by Age with green dots for Ages with labor force non-participation over 50%
	cpsa2016_cpsaat03_clean$Colorvariable <-cut(cpsa2016_cpsaat03_clean$NILF.Pct, breaks=c(-Inf, 50, Inf), labels=c("black", "green"))
	ggplot(data=cpsa2016_cpsaat03_clean) +
	  geom_point(mapping=aes(x=Age, y=NILF.Pct), color=cpsa2016_cpsaat03_clean$Colorvariable) + 
	  theme(axis.text.x=element_text(angle=90,hjust=1)) +
	  ggtitle("Age vs. Percent of Population Not in Labor Force") +
	  labs(x = "Age", y ="Percent of Population Not in Labor Force")
	