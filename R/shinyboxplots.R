#' Shiny App Boxplot
#'
#' Creates dynamic boxplots using shiny where the values of mean
#' and standard deviation (which are entered into the function rnorm and populates
#' x and y) can be changed using widgets and the data can be defined as either paired or
#' not paired
#'
#' Using this package, the displayed boxplots with change accordingly and confidence
#' interval and test type will be returned to the R console while running the app.
#'
#'
#' @return side-by-side boxplots for two samples or difference of means boxplot for paired
#' data
#' @export
#'
#' @examples
#' \dontrun{shinyboxplots()}
shinyboxplots <- function(){
  shiny::runApp(system.file("shiny1/example",
  package = "DSA5041PROJ2"),launch.browser = TRUE)
}
