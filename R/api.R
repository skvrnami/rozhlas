#' Get stations
#'
#' @return Data.frame of data on stations (id, name, description, links)
#' @export
#' @examples
#' \dontrun{
#' get_stations()
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_stations <- function(){
    out <- httr::GET("https://api.rozhlas.cz/data/v2/meta/stations.json")
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}

#' Get programme for today
#'
#' @return List of data.frames with programme (a data.frame for each station)
#' @export
#' @examples
#' \dontrun{
#' get_current_programme()
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_current_programme <- function(){
    out <- httr::GET("https://api.rozhlas.cz/data/v2/schedule/day.json")
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}

#' Get programme for today for a given station
#'
#' @param station ID of station
#' @return A data.frames with programme
#' @export
#' @examples
#' \dontrun{
#' get_current_station_programme("radiozurnal")
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_current_station_programme <- function(station){
    out <- httr::GET(glue::glue("https://api.rozhlas.cz/data/v2/schedule/day/{station}.json"))
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}

#' Get programme for a given day for all stations
#'
#' @param day Date (in YYYY-MM-DD format)
#' @return List of data.frames with programme (one data.frame for each station)
#' @export
#' @examples
#' \dontrun{
#' get_day_programme("2021-09-30")
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_day_programme <- function(day){
    date <- as.Date(day, format = "%Y-%m-%d")
    year <- as.character(lubridate::year(date))
    month <- make_twodigit_date(lubridate::month(date))
    day <- make_twodigit_date(lubridate::day(date))

    out <- httr::GET(glue::glue("https://api.rozhlas.cz/data/v2/schedule/day/{year}/{month}/{day}.json"))
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}

#' Get programme for a given day and station
#'
#' @param day Date (in YYYY-MM-DD format)
#' @param station ID of station
#' @return A data.frame with programme
#' @export
#' @examples
#' \dontrun{
#' get_day_programme("2021-09-30", "radiozurnal")
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_day_station_programme <- function(day, station){
    date <- as.Date(day, format = "%Y-%m-%d")
    year <- as.character(lubridate::year(date))
    month <- make_twodigit_date(lubridate::month(date))
    day <- make_twodigit_date(lubridate::day(date))

    out <- httr::GET(glue::glue("https://api.rozhlas.cz/data/v2/schedule/day/{year}/{month}/{day}/{station}.json"))
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}

#' Get Radio Wave's playlist for today
#'
#' @return A data.frame with playlist
#' @export
#' @examples
#' \dontrun{
#' get_wave_playlist()
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_wave_playlist <- function(){
    out <- httr::GET("https://api.rozhlas.cz/data/v2/playlist/day/radiowave.json")
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}

#' Get Radio Wave's playlist for a given day
#'
#' @param day Date (in YYYY-MM-DD format)
#' @return A data.frame with playlist
#' @export
#' @examples
#' \dontrun{
#' get_day_wave_playlist("2021-09-30")
#' }
#' @seealso
#' \url{https://data.irozhlas.cz/opendata/}
#'
get_day_wave_playlist <- function(day){
    date <- as.Date(day, format = "%Y-%m-%d")
    year <- as.character(lubridate::year(date))
    month <- make_twodigit_date(lubridate::month(date))
    day <- make_twodigit_date(lubridate::day(date))

    out <- httr::GET(glue::glue("https://api.rozhlas.cz/data/v2/playlist/day/{year}/{month}/{day}/radiowave.json"))
    intToUtf8(out$content) %>%
        jsonlite::fromJSON() %>%
        `[[`("data")
}
