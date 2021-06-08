## Plot 1

# Downloading the data and unzipping it
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.zip"
download.file(url, file, method = "curl", mode = "wb")
unzip(file)

# Reading the data from the txt file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Running basic QC on the data frame
head(data)
summary(data)
str(data)
dim(data)
## 2075259 9; data is loaded in correctly

# Converting date column from character to date format
data[,"Date"] <- as.Date(data$Date,format = "%d/%m/%Y")

# Subsetting the data to only 01/02/2007 and 02/02/2017
data_sub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Running basic QC on the subsetted data
str(data_sub)
dim(data_sub)
unique(data_sub$Date)
## data set has been prepared correctly

# Opening png device
png("plot1.png",width = 480, height = 480, units = "px")

# Creating the histogram
with(data_sub, hist(data_sub$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))

# Closing the device
dev.off()