#' Plot method for Rttest
#'
#' Creates boxplots of the data when no-paired and paired data is
#' analyzed
#'
#' @param x list created from constructor function
#' @param ... additional arguments
#' @importFrom ggplot2 ggplot geom_boxplot geom_errorbar aes labs guides last_plot
#' @importFrom dplyr %>%
#' @importFrom purrr map2
#'
#' @return boxplots of the data when non-paired data is analyzed and
#' boxplot of differences in data when paired = TRUE with the confidence
#' interval for the difference of means plotted inside the boxplot of
#' differences
#' @export plot.Rttest
#'
#' @export
#'
#' @examples \dontrun{plot(ans1)}
plot.Rttest = function(x,...){
  stopifnot(is.list(x))
  l <- NULL
  df = x$data

  if (x$test_type != "Paired"){
    pop = rep(c("x", "y"), c(30, 30))
    data.frame(pop = pop,l=c(df$x, df$y)) %>%
      ggplot(aes(x = pop, y = l, fill = pop)) + geom_boxplot() +
      labs(title = "Boxplots for Non-Paired Data Sets", x = "Data Set",y = "Distribution")

  } else {
    pop = rep("x", 30)
    data.frame(pop = pop,l= unlist(map2(df$x,df$y, function(a,b)a-b))) %>%
      ggplot(aes(x = pop, y = l, fill = pop)) + geom_boxplot() +
      geom_errorbar(aes(ymin = x$ci[[1]], ymax = x$ci[[2]],
                        width = 0, linewidth = .25)) +
      guides(linewidth = "none", fill = "none") +
      labs(title = "Boxplot of Differences", x = "x-y",y = "Distribution")
  }

  print(last_plot())
}
