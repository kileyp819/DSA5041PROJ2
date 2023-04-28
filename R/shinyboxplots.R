#' Shiny App Boxplot
#'
#' Creates two dynamic boxplots using shiny where the values of sample size, mean,
#' and standard deviation (which are entered into the function rnorm and populates
#' x and y) can be changed using widgets
#'
#'
#' @return two boxplots displayed side-by-side, for two samples
#' @export
#'
#' @examples
#' \dontrun{shinyboxplots()}
shinyboxplots <- function(){
  shiny::runApp(system.file("shiny1/example",
  package = "DSA5041PROJ2"),launch.browser = TRUE)
}
