#' Ttest constructor function
#'
#' This constructor investigates the data for evidence
#' in the population variances and an appropriate t-test
#' is made to produce a list.
#'
#' A constructor function makes an object of a particular OOP
#' class and makes a lot of useful statistical information that
#' methods operate on to produce whatever particulars we need
#'
#' @param x vector of sample data
#' @param y vector of sample data
#' @param alpha level of significance
#' @param paired denotes whether or not the samples are "paired"
#' @importFrom stats var.test t.test
#'
#' @return a list identifying which test was conducted, a Y/N
#' conclusion as to whether we should reject the NULL of equality
#' of means at the alpha level of significance, the summary statistics made
#' by the appropriate t.test and the data in a list
#' @export
#'
#' @examples
#' \dontrun{myttest(x,y,alpha=0.05,paired=FALSE)}
myttest = function(x, y, alpha, paired = FALSE){
  v = var.test(x,y)
  if(paired == TRUE){
    tp = t.test(x,y,mu = 0, paired = TRUE)
    test_type = "Paired"
  } else if (v$p.value < 0.05){
    tp = t.test(x,y, var.equal = FALSE)
    test_type = "Welch"
  } else if (v$p.value >= 0.05){
    tp = t.test(x,y, var.equal = TRUE)
    test_type = "T-test"
  }
  if (v$p.value < 0.05){
    conclusion = "Y"
  } else{
    conclusion = "N"
  }
  ans = list(data = data.frame(x = x, y = y), alpha = alpha, ci = tp$conf.int, pvalue = tp$p.value, test_type = test_type, conclusion = conclusion)
  class(ans) = "Rttest"
  return(ans)
}
