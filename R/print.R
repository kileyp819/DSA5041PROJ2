#' Print method for Rttest
#'
#' Prints a (1-alpha)100 percent confidence interval for the difference of means with
#' appropriate headings
#'
#' @param x list created from constructor function
#' @param ... additional arguments
#'
#' @return a (1-alpha)100 percent confidence interval for mux-muy
#' and the test type used on the data with appropriate headings
#' @export print.Rttest
#'
#' @export
#'
#' @examples \dontrun{print(ans1)}
print.Rttest = function(x, ...){
  stopifnot(is.list(x))
  cat("$ci\n")
  print(x$ci)
  cat("\n$test_type\n")
  print(x$test_type)
}
