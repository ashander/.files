author <- paste0(
  "'",
  utils::person(
    "Jaime",
    "Ashander",
    email = "ashander@stanfordalumni.org",
    role  = c("aut", "cre")),
  "'"
)

options("device" = "quartz",
        "repos" = c(CRAN = "http://cran.r-project.org/"), #use main cran repo
        showWarnCalls=T, showErrorCalls=T,
        menu.graphics =FALSE,
        browserNLdisabled=TRUE,
	devtools.name = "Jaime",
	devtools.desc.author =  author,
	devtools.desc.license = "GPL (>= 2)"
	)
#options(repos=c("http://cran.cnr.Berkeley.edu","http://cran.stat.ucla.edu"))

options("width"=160,
        "digits.secs"=3)

if (interactive()) {
     print("devtools, lintr loaded in interactive mode")
     require(devtools)
     require(lintr)
}
options(rstudio.markdownToHTML =
  function(inputFile, outputFile) {
    system(paste("pandoc", shQuote(inputFile), "-o", shQuote(outputFile)))
  }
)

setHook('plot.new', function(...)
  par(mar=c(3,4,2,1), mgp=c(2,.7,0), tck=-.01, las=1, bty="l")
)

# yes I want to quit
q <- function(save = "no", status = 0, runLast = TRUE){
.Internal(quit(save, status, runLast))
#<environment: namespace:base>
}



