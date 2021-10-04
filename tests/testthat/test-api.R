test_that("test API", {
    expect_true(nrow(get_stations()) > 20)
    expect_true(nrow(get_current_programme()$radiozurnal) > 10)
    expect_true(nrow(get_current_station_programme("radiozurnal")) > 10)
    expect_true(nrow(get_day_programme("2021-01-01")$radiozurnal) > 10)
    expect_true(nrow(get_day_station_programme("2021-01-01", "radiozurnal")) > 10)
    expect_true(nrow(get_wave_playlist()) > 10)
    expect_true(nrow(get_day_wave_playlist("2021-01-01")) > 10)
})
