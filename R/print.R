#' Print method for Rttest
#'
#' Prints a (1-alpha)100% confidence interval for the difference of means
#'
#' @param x list created from constructor function
#' @param ... additional arguments
#'
#' @return prints a (1-alpha)100% confidence interval for mux-muy
#' and the test type used on the data
#' @export
#'
#' @examples \dontrun{print(ans1)}
print.Rttest = function(x, ...){
  stopifnot(is.list(x))
  print(x$ci)
  print(x$test_type)
}
