


1. Database
SQLITE
Installing
Selecting
Inserting
MySQL
Installing
Linux
Windows
Selecting
PostgreSQL
RODBC
Read MS Excel Files
Reading and Writing Data
Connections
Examples
Data Frames
Determining Size
Date/Time
Parse a Date
Dates and data.frames
Format a Date
Time Intervals
Time Sequences
Formulas
Graphics
Simple Plot
Plot Multiple Timeseries
Pause between Plots
Plot a filled countour
Examples
Plot Least Squares Fit
Plot ESRI Shapefile
Clustering
Package ''flexclust''
Machine Learning/Statistical Learning
Spatial data
Work with shapefiles
Timeseries
Create a Timeseries
Extending a Timeseries
Debugging
browser
debug/undebug
Random Data
Generate a Random Matrix

#### 1. Database

SQLITE
Access to sqlite is provided via the RSQLite package.

Installing

sudo R install.packages("RSQLite")

Selecting
Note: To fetch all rows of a resultset, append n=-1 to your fetch statement.
library(RSQLite) driver = dbDriver("SQLite") con <- dbConnect(driver,dbname="some_sqlite.db") dbListTables(con) # show tables rs <- dbSendQuery(con, "SELECT * from sensordata limit 10") # send a query data <- fetch(rs,n=3) # fetch 3 rows from result (use -1 to fetch all rows) dbHasCompleted(rs) # checks if other rows left and returns true/false #cleanup dbClearResult(rs) dbDisconnect(con) dbUnloadDriver(driver)

Inserting
library(RSQLite); driver = dbDriver("SQLite"); con <- dbConnect(driver, dbname="/home/soma/Desktop/testdata.db"); data(USArrests); #prepare some data frame dbWriteTable(con,"arrests", USArrests); # insert it as a table #cleanup dbClearResult(rs); dbDisconnect(con); dbUnloadDriver(driver);

MySQL

Installing

Linux
sudo aptitude install r-cran-rmysql

Windows
Set system variable MYSQL_HOME (RMYSQL directory in R-directory e.g. C:\Programme\R\R-2.8.1\library\RMySQL)
Directory defined above has to contain the client DLL for MySQL-Servers. A specific structure of subdirectories has to be created.

#### Selecting
library(RMySQL) roadid = 1234 laneid = 1 drv = dbDriver("MySQL") con = dbConnect(drv,dbname="flow_timeseries",user="123",pass="123",host="10.10.10.10") sql <- paste("SELECT * from timeseries WHERE roadid = ",roadid,"AND laneid = ",laneid,"ORDER BY day") res <- dbSendQuery(con,sql) data <- fetch(res, n = -1) dbDisconnect(con)

#### PostgreSQL
Install the r-base postgres server dependencies

sudo apt-get install r-base-dev postgresql-server-dev-8.3 sudo R
In an R shell, install the necessary packages

rS="http://www.bioconductor.org/packages/release/bioc/" install.packages("Rdbi", repos=rS, dependencies=TRUE) install.packages("RdbiPgSQL", repos=rS, dependencies=TRUE)
Talk to a postgres from within R:
library(RdbiPgSQL) drv <- PgSQL() con <- dbConnect(drv, dbname="advanced", user="1234", password="1234", host="10.10.10.10") res <- dbSendQuery(con, "SELECT * FROM ...") data <- dbGetResult(res) dbDisconnect(con)

RODBC
Package RODBC on CRAN provides an interface to database sources supporting an ODBC interface. This is very widely available, and allows the same R code to access different database systems. RODBC runs on both Unix/Linux and Windows, and almost all database systems provide support for ODBC.

Read MS Excel Files
As a simple example of using ODBC under Windows with a Excel spreadsheet, we can read from a spreadsheet by
library(RODBC) channel <- odbcConnectExcel("bdr.xls") ## list the spreadsheets > sqlTables(channel)
TABLE_CAT TABLE_SCHEM TABLE_NAME TABLE_TYPE REMARKS 1 C:\\bdr NA Sheet1$ SYSTEM TABLE NA 2 C:\\bdr NA Sheet2$ SYSTEM TABLE NA 3 C:\\bdr NA Sheet3$ SYSTEM TABLE NA 4 C:\\bdr NA Sheet1$Print_Area TABLE NA
sh1 <- sqlFetch(channel, "Sheet1") sh1 <- sqlQuery(channel, "select * from [Sheet1$]")

#### Reading and Writing Data

Connections
Connections provide a flexible way for R to read data from a variety of sources, providing more complete control over the nature of the connection than simply specifying a file name as input to functions like read.table and scan.
file: files on the local file system
pipe: output from a command
textConnection: treats text as a file
gzfile: local gzipped file
unz: local zip archive (with single file; read-only)
bzfile: local bzipped file
url: remote file read via http
socketConnection: socket for client/server programs

##### Examples
Skip last lines of a data file (e.g. last two lines):
con <- textConnection(rev(rev(readLines('data.txt'))[-(1:2)])) data <- read.table(con) close(con)
Read data from gzip-compressed file:
gz <- gzfile("datafile.csv.gz", "r") raw <- textConnection(readLines(gz)) close(gz) dataset <- read.table(raw, sep=";", as.is=TRUE, header=TRUE) close(raw)

#### Data Frames

Determining Size
df = data.frame(...) row_count = nrow(df) col_count = ncol(df) dim(df)

#### Date/Time
R and its contributed packages have a number of datetime (i.e. date or date/time) classes:
POSIX classes: POSIX classes refer to the two classes POSIXct, POSIXlt and their common super class POSIXt. These support times and dates including time zones and standard vs. daylight savings time.
Date: Date is the newest R date class, introduced in R-1.9.0. It supports dates without times. Eliminating times simplifies dates substantially since not only are times, themselves, eliminated but the potential complications of timezones and daylight savings time vs. standard time need not be considered either. Date has an interface similar to the POSIX classes discussed below making it easy to move between them.

chron: The CRAN-Package chron provides dates and times. There are no time zones or notion of daylight vs. standard time in chron which makes it simpler to use for most purposes than date/time packages that do employ time zones.
References: R News, The Newsletter of the R Project, Volume 4/1, June 2004, ISSN 1609-3631, http://cran.r-project.org/doc/Rnews/Rnews_2004-1.pdf

#### Parse a Date

d1 <- as.Date("2008-05-18") class(d1) # Output: [1] "Date" d2 <- strptime("2008-01-01 14:30", "%Y-%m-%d %H:%M") class(d2) # Output: [1] "POSIXt" "POSIXlt" d3 <- as.POSIXct("2008-01-01 14:30", tz="GMT") class(d3) #Output: [1] "POSIXt" "POSIXct"
See strptime for formatting details
All functions also work for lists:

strptime(c("2008-01-01 14:30","2008-02-02 0:30"), "%Y-%m-%d %H:%M")

####  Dates and data.frames
If you want to store your date in a data.frame you will NOT be able to use POSIXlt. The reason for this is that a POSIXlt actually is a list with 9 elements. So if you want to add your dates to a data.frame you will need to convert your dates to POSIXct:

data$time = as.POSIXct(strptime(data$time_string, "%H:%M:%S"))

####Format a Date
format(d1, "%a %Y/%m/%d") #[1] "So 2008/05/18" format(d2, "%A %Y/%m/%d") # [1] "Dienstag 2008/01/01"

#### Time Intervals

```{r}
b1 <- ISOdate(1977,7,13) 
b2 <- ISOdate(2003,8,14) 
b2 - b1 # Time difference of 9528 days 
> class(b2-b1) 
[1] "difftime"
```
If an alternative unit of time is desired, the <tt>difftime</tt> function can be called, using the optional <tt>units=</tt> argument with any of the following values: "auto", "secs", "mins", "hours", "days", or "weeks".
difftime(b2,b1,units="weeks") #Time difference of 1361.143 weeks

#### Time Sequences
The by=> argument to the seq function can be specified either as a difftime value, or in any units of time that the difftime function accepts, making it very easy to generate sequences of dates.
```{r}
seq(as.Date("1976-07-04"),by="days",length=10) 
# 
[1] "1976-07-04" "1976-07-05" "1976-07-06" "1976-07-07" "1976-07-08" 
[6] "1976-07-09" "1976-07-10" "1976-07-11" "1976-07-12" "1976-07-13" 
seq(as.Date("2000-06-01"),to=as.Date("2000-08-01"),by="2 weeks") 
# 
[1] "2000-06-01" "2000-06-15" "2000-06-29" "2000-07-13" "2000-07-27" 
seq(as.POSIXct("2009-03-23 00:00:00", tz="GMT"), length=96, by="15 mins") 
# 
[1] "2009-03-23 00:00:00 GMT" "2009-03-23 00:15:00 GMT" 
[3] "2009-03-23 00:30:00 GMT" "2009-03-23 00:45:00 GMT"
```
#### Formulas
Formulas in R can be thought of as a "little language" since they obey a different structure and syntax from expressions. Expressions when evaluated produce some result such as a number, vector or list which is then displayed by the print function. Formulas on the other hand are used as a concise and intuitive way of specifying a statistical model. For example, consider a multiple linear regression of y on a numeric variable x1 and its squared value, x1^2 and a categorical variable x2. Note that in R categorical variables are called factors. This regression is specified by:
y ~ x1 + I(x1^2) + x2
and could be fit using the lm function (linear model, regression):
lm(y ~ x1 + I(x1^2) + x2)

In the formula notation, "~" means the left-hand-side is the independent variable or response and the right-hand-side are the dependent variables. The I(x1^2) means interpret the inside expression as a regular expression in R. Including a factor variable like x2 is very convenient since we don't have to be bothered about specifying all the indicator variables as we would have to do in other statistical software.

[http://cran.r-project.org/doc/manuals/R-intro.html#Formulae-for-statistical-models Defining statistical models; formulae]
