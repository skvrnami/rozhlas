#' @importFrom magrittr %>%
NULL

#' Make single digit dates (days, months) to two digits
#'
#' @param x number
make_twodigit_date <- function(x){
    if(x < 10){
        paste0("0", as.character(x))
    }else{
        as.character(x)
    }
}
