#' Plot method for Rttest
#'
#' Creates boxplots of the data when no-paired and paired data is
#' analyzed
#'
#' @param x list created from constructor function
#' @param ... additional arguments
#' @importFrom ggplot2 ggplot geom_boxplot geom_errorbar
#'
#' @return boxplots of the data when non-paired data is analyzed and
#' boxlpot of differences in data when paired = TRUE with the confidence
#' interval for the difference of means plotted inside the boxplot of
#' differences
#' @export
#'
#' @examples \dontrun{plot(ans1)}
plot.Rttest = function(x,...){
  stopifnot(is.list(x))
  df = x$data
  if (x[[4]] != "Paired"){
    pop = rep(c("x", "y"), c(30, 30))
    df2 = data.frame(pop = pop, l=c(df$x, df$y))
    g = ggplot(df2, aes(x = pop, y = l, fill = pop)) + geom_boxplot() +
      labs(title = "Side-by-side Boxplot",
           x = "cat",
           y = "Samples")
  } else {
    pop = rep("Difference", 30)
    df2 = data.frame(pop = pop, l=df$x- df$y)
    g = ggplot(df2, aes(x = pop, y = l, fill = pop)) + geom_boxplot() + geom_errorbar(aes(ymin = ans3[[3]][[1]], ymax = ans3[[3]][[2]], width = 0, size = .25)) + guides(size = FALSE, fill = FALSE) +
      labs(title = "Difference between x and y",
           x = "x",
           y = "myd")
  }
  print(g)
}
