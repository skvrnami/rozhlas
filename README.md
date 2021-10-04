
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rozhlas

<!-- badges: start -->
<!-- badges: end -->

The goal of `rozhlas` is to provide access to Czech Radio’s open data
API on broadcasting programme and Radio Wave’s playlists.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("skvrnami/rozhlas")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dplyr)
library(rozhlas)
```

## Stations

Function `get_stations` returns data.frame with data on Czech Radio
stations.

``` r
stations <- get_stations()
glimpse(stations)
#> Rows: 26
#> Columns: 10
#> $ id              <chr> "radiozurnal", "dvojka", "vltava", "plus", "radiozurna…
#> $ domain          <chr> "radiozurnal", "dvojka", "vltava", "plus", "sport", "w…
#> $ name            <chr> "Radiožurnál", "Dvojka", "Vltava", "Plus", "Radiožurná…
#> $ description     <chr> "zpravodajství a publicistika", "Rádio, které vás baví…
#> $ longdescription <df[,1]> <data.frame[26 x 1]>
#> $ type            <chr> "allover", "allover", "allover", "allover", "allove…
#> $ number          <int> 1, 2, 3, 97, 120, 19, 26, 99, 96, 128, NA, 12, 9, 6, 8…
#> $ number_rscr     <int> 5, 7, 6, 30, NA, 56, 50, 65, 54, 10, 43, 20, 11, 18, 1…
#> $ asset           <chr> "https://data.rozhlas.cz/api/v2/asset/station/radiozur…
#> $ services        <df[,10]> <data.frame[26 x 10]>
```

``` r
stations %>% 
    select(id, name, type) %>%
    head() %>%
    knitr::kable()
```

| id                | name              | type    |
|:------------------|:------------------|:--------|
| radiozurnal       | Radiožurnál       | allover |
| dvojka            | Dvojka            | allover |
| vltava            | Vltava            | allover |
| plus              | Plus              | allover |
| radiozurnal-sport | Radiožurnál Sport | allover |
| radiowave         | Radio Wave        | allover |

## Programme

The data on Czech Radio’s programme are available using four functions
`get_current_programme` (for current day and all stations),
`get_current_station_programme` (for current day and a specified
station), `get_day_programme` (for a specified day and all stations) and
`get_day_station_programme` (for a specified day and station).

``` r
today_programme <- get_current_programme()
today_programme$plus %>%
    head() %>%
    knitr::kable()
#> Warning in `[<-.data.frame`(`*tmp*`, , j, value = structure(list(id =
#> structure(c("1", : provided 3 variables to replace 1 variables
```

| station |       id | title                               | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | since                     | till                      | repetition | type | edition                                                                                                                                                                  | persons |
|:--------|---------:|:------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------|:--------------------------|:-----------|:-----|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------|
| plus    | 17332524 | Zprávy                              | Aktuální události doma i ve světě                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 2021-10-01T00:00:00+02:00 | 2021-10-01T00:10:00+02:00 | FALSE      | 1    | 6483164 , <https://plus.rozhlas.cz/zpravy-6483164> , <https://data.rozhlas.cz/api/v2/asset/show/6483164.jpg>                                                             | NULL    |
| plus    | 17332525 | Interview Plus                      | Timothy Garton Ash, britský historik, spisovatel a znalec střední Evropy. Proč se v Maďarsku, Polsku, ale i v Česku ozývá tolik hlasů zatracujících Evropskou unii? Bylo by těmto zemím mimo unii lépe? A jsou demokracie v zemích visegrádské skupiny v ohrožení?                                                                                                                                                                                                                                                                                   | 2021-10-01T00:10:00+02:00 | 2021-10-01T00:36:00+02:00 | TRUE       | 2    | 6504167 , <https://plus.rozhlas.cz/interview-plus-6504167> , <https://api.mujrozhlas.cz/show-redirect/6504167> , <https://data.rozhlas.cz/api/v2/asset/show/6504167.jpg> | NULL    |
| plus    | 17332526 | Pro a proti                         | Výkonný výbor hokejového svazu vyslovil důvěru prezidentovi Tomáš Královi, přestože za minulého režimu spolupracoval s vojenskou kontrarozvědkou StB. Má člověk s takovou minulostí působit ve vysoké veřejné funkci a pracovat s mládeží? Můžeme odsuzovat lidi za spolupráci s StB bez znalosti kontextu a doby? A sílí ve společnosti tendence relativizující nebezpečnost komunistického režimu? Debatovat budou ředitelka Archivu bezpečnostních složek Světlana Ptáčníková a výkonný ředitel Platformy evropské paměti a svědomí Peter Rendek. | 2021-10-01T00:36:00+02:00 | 2021-10-01T01:00:00+02:00 | TRUE       | 2    | 6482952 , <https://plus.rozhlas.cz/pro-a-proti-6482952> , <https://api.mujrozhlas.cz/show-redirect/6482952> , <https://data.rozhlas.cz/api/v2/asset/show/6482952.jpg>    | NULL    |
| plus    | 17332527 | Zprávy                              | Aktuální události doma i ve světě                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 2021-10-01T01:00:00+02:00 | 2021-10-01T01:05:00+02:00 | FALSE      | 1    | 6483164 , <https://plus.rozhlas.cz/zpravy-6483164> , <https://data.rozhlas.cz/api/v2/asset/show/6483164.jpg>                                                             | NULL    |
| plus    | 17332528 | Zprávy v angličtině/News in English | Pětiminutový přehled aktuálního dění v anglickém jazyce. News in English offers a concise, English-language overview of events in the Czech Republic in the areas of politics, the economy and culture.                                                                                                                                                                                                                                                                                                                                              | 2021-10-01T01:05:00+02:00 | 2021-10-01T01:10:00+02:00 | FALSE      | 1    | 6483120 , <https://plus.rozhlas.cz/zpravy-v-anglictinenews-english-6483120>, <https://data.rozhlas.cz/api/v2/asset/show/6483120.jpg>                                     | NULL    |
| plus    | 17332529 | Jak to vidí…                        | Jak migrace v pravěku ovlivnila dnešní lidi ve střední Evropě, vysvětlil popularizátor vědy Václav Cílek v pořadu Jak to vidí. A popsal také to, co má svatá Ludmila společného s Ruskem, nebo Ukrajinou. Ve vysílání Dvojky se ptala Zita Senková.                                                                                                                                                                                                                                                                                                  | 2021-10-01T01:10:00+02:00 | 2021-10-01T01:30:00+02:00 | TRUE       | 2    | 5001081 , <https://dvojka.rozhlas.cz/jak-vidi-5001081> , <https://api.mujrozhlas.cz/show-redirect/5001081> , <https://data.rozhlas.cz/api/v2/asset/show/5001081.jpg>     | NULL    |

``` r
rz_today_programme <- get_current_station_programme("radiozurnal")
rz_today_programme %>%
    head() %>%
    knitr::kable()
#> Warning in `[<-.data.frame`(`*tmp*`, , j, value = structure(list(id =
#> structure(c("1", : provided 3 variables to replace 1 variables
```

| station     |       id | title                     | description                                                                                                                                                                                                                                                                                                                                                                  | since                     | till                      | repetition | type | edition                                                                                                                                                                                   | persons                                                                                                                                     |
|:------------|---------:|:--------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------|:--------------------------|:-----------|:-----|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------|
| radiozurnal | 17345489 | Zprávy                    | Zpravodajství z Česka i ze světa. Sport, Zelená vlna a předpověď počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                                                                                                                                                                                                       | 2021-10-01T00:00:00+02:00 | 2021-10-01T00:09:00+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>                                                                       | NULL                                                                                                                                        |
| radiozurnal | 17345492 | Dvacet minut Radiožurnálu | Hostem je Erik Geuss, ředitel České inspekci životního prostředí. Příští úterý se poslanci sejdou na mimořádné schůzi k závěrům vyšetřovací komise o loňské havárii na řece Bečvě. Co komise v této souvislosti inspekci vytýká? Opravdu je zpráva komise zpolitizovaná, jak tvrdí ministr životního prostředí Richard Brabec z hnutí ANO? Moderuje Vladimír Kroc. (repríza) | 2021-10-01T00:10:00+02:00 | 2021-10-01T00:30:00+02:00 | TRUE       | 2    | 5997743 , <https://radiozurnal.rozhlas.cz/dvacet-minut-radiozurnalu-5997743>, <https://api.mujrozhlas.cz/show-redirect/5997743> , <https://data.rozhlas.cz/api/v2/asset/show/5997743.jpg> | 5004021 , Vladimír Kroc , <https://informace.rozhlas.cz/vladimir-kroc-5004021> , <https://data.rozhlas.cz/api/v2/asset/profile/5004021.jpg> |
| radiozurnal | 17345493 | Zprávy                    | Z domova i ze světa. Sport, Zelená vlna a počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                                                                                                                                                                                                                              | 2021-10-01T00:30:00+02:00 | 2021-10-01T00:32:00+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>                                                                       | NULL                                                                                                                                        |
| radiozurnal | 17345496 | Noční Radiožurnál         | Aktuální reportáže a nejrychlejší zpravodajství. Moderuje Adam Carda.                                                                                                                                                                                                                                                                                                        | 2021-10-01T00:33:00+02:00 | 2021-10-01T01:00:00+02:00 | FALSE      | 15   | 5997477 , <https://radiozurnal.rozhlas.cz/nocni-radiozurnal-5997477>, <https://data.rozhlas.cz/api/v2/asset/show/5997477.jpg>                                                             | NULL                                                                                                                                        |
| radiozurnal | 17345497 | Zprávy                    | Zpravodajství z Česka i ze světa. Sport, Zelená vlna a předpověď počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                                                                                                                                                                                                       | 2021-10-01T01:00:00+02:00 | 2021-10-01T01:04:00+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>                                                                       | NULL                                                                                                                                        |
| radiozurnal | 17345500 | Noční Radiožurnál         | Aktuální reportáže a nejrychlejší zpravodajství. Moderuje Adam Carda.                                                                                                                                                                                                                                                                                                        | 2021-10-01T01:05:00+02:00 | 2021-10-01T02:00:00+02:00 | FALSE      | 15   | 5997477 , <https://radiozurnal.rozhlas.cz/nocni-radiozurnal-5997477>, <https://data.rozhlas.cz/api/v2/asset/show/5997477.jpg>                                                             | NULL                                                                                                                                        |

``` r
sept30 <- get_day_programme("2021-09-30")
sept30$plus %>%
    head() %>%
    knitr::kable()
#> Warning in `[<-.data.frame`(`*tmp*`, , j, value = structure(list(id =
#> structure(c("1", : provided 3 variables to replace 1 variables
```

| station |       id | title                               | description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | since                     | till                      | repetition | type | edition                                                                                                                                                                  | persons                                                                                                                               |
|:--------|---------:|:------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------|:--------------------------|:-----------|:-----|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------|
| plus    | 17271285 | Zprávy                              | Aktuální události doma i ve světě                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | 2021-09-30T00:00:00+02:00 | 2021-09-30T00:10:00+02:00 | FALSE      | 1    | 6483164 , <https://plus.rozhlas.cz/zpravy-6483164> , <https://data.rozhlas.cz/api/v2/asset/show/6483164.jpg>                                                             | NULL                                                                                                                                  |
| plus    | 17271286 | Interview Plus                      | Docent Pavel Plevka, virolog a biochemik. Jak se bude dále vyvíjet virus způsobující covid-19? Blíží se doba, kdy z něj bude něco na způsob běžné chřipky? A je současný relativní klid důkazem, že máme virus pod kontrolou?                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 2021-09-30T00:10:00+02:00 | 2021-09-30T00:36:00+02:00 | TRUE       | 2    | 6504167 , <https://plus.rozhlas.cz/interview-plus-6504167> , <https://api.mujrozhlas.cz/show-redirect/6504167> , <https://data.rozhlas.cz/api/v2/asset/show/6504167.jpg> | NULL                                                                                                                                  |
| plus    | 17271292 | Pro a proti                         | Vláda v pondělí přidala státním zaměstnancům 1400 Kč. Podle zdravotních odborů je ale zvýšení platů nedostatečné a příští týden chtějí vyjednat desetiprocentní růst mezd pro lékaře a 3000 korun navíc pro zdravotní sestry.  Přineslo by takové zvýšení platů zkvalitnění péče o pacienty, protože by si lékaři už nemuseli přivydělávat na přesčasech? Nebo by se naopak neměl kdo o pacienty starat, protože by lékaři žádali kratší pracovní úvazky a ve zdravotních zařízeních by se prohloubila personální krize? Pozvání do debaty přijali předsedkyně Odborového svazu zdravotnictví a sociální péče Dagmar Žitníková a předseda České gynekologické a porodnické společnosti Vladimír Dvořák. | 2021-09-30T00:36:00+02:00 | 2021-09-30T01:00:00+02:00 | TRUE       | 2    | 6482952 , <https://plus.rozhlas.cz/pro-a-proti-6482952> , <https://api.mujrozhlas.cz/show-redirect/6482952> , <https://data.rozhlas.cz/api/v2/asset/show/6482952.jpg>    | NULL                                                                                                                                  |
| plus    | 17271288 | Zprávy                              | Aktuální události doma i ve světě                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | 2021-09-30T01:00:00+02:00 | 2021-09-30T01:04:57+02:00 | FALSE      | 1    | 6483164 , <https://plus.rozhlas.cz/zpravy-6483164> , <https://data.rozhlas.cz/api/v2/asset/show/6483164.jpg>                                                             | NULL                                                                                                                                  |
| plus    | 17271289 | Zprávy v angličtině/News in English | Pětiminutový přehled aktuálního dění v anglickém jazyce. News in English offers a concise, English-language overview of events in the Czech Republic in the areas of politics, the economy and culture.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 2021-09-30T01:04:57+02:00 | 2021-09-30T01:10:09+02:00 | FALSE      | 1    | 6483120 , <https://plus.rozhlas.cz/zpravy-v-anglictinenews-english-6483120>, <https://data.rozhlas.cz/api/v2/asset/show/6483120.jpg>                                     | NULL                                                                                                                                  |
| plus    | 17271290 | Jak to vidí…                        | Co znamenají pro Evropu a Českou republiku výsledky voleb v Německu, to popsal publicista Adam Černý v pořadu Jak to vidí Českého rozhlasu Dvojka. Ptala se Zita Senková.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | 2021-09-30T01:10:00+02:00 | 2021-09-30T01:30:00+02:00 | TRUE       | 2    | 5001081 , <https://dvojka.rozhlas.cz/jak-vidi-5001081> , <https://api.mujrozhlas.cz/show-redirect/5001081> , <https://data.rozhlas.cz/api/v2/asset/show/5001081.jpg>     | 5003325 , Adam Černý , <https://informace.rozhlas.cz/adam-cerny-5003325> , <https://data.rozhlas.cz/api/v2/asset/profile/5003325.jpg> |

``` r
rz_sept30 <- get_day_station_programme("2021-09-30", "radiozurnal")
rz_sept30 %>%
    head() %>%
    knitr::kable()
#> Warning in `[<-.data.frame`(`*tmp*`, , j, value = structure(list(id =
#> structure(c("1", : provided 3 variables to replace 1 variables
```

| station     |       id | title                               | description                                                                                                                                                                                       | since                     | till                      | repetition | type | edition                                                                                                                       | persons                                                                                                                                                                                                                                                                                    |
|:------------|---------:|:------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------------------------|:--------------------------|:-----------|:-----|:------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| radiozurnal | 17345287 | Zprávy                              | Zpravodajství z Česka i ze světa. Sport, Zelená vlna a předpověď počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                            | 2021-09-30T00:00:00+02:00 | 2021-09-30T00:09:00+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>           | NULL                                                                                                                                                                                                                                                                                       |
| radiozurnal | 17345294 | Noční Radiožurnál                   | Aktuální reportáže a nejrychlejší zpravodajství. Moderuje Adam Carda.                                                                                                                             | 2021-09-30T00:10:00+02:00 | 2021-09-30T01:00:00+02:00 | FALSE      | 15   | 5997477 , <https://radiozurnal.rozhlas.cz/nocni-radiozurnal-5997477>, <https://data.rozhlas.cz/api/v2/asset/show/5997477.jpg> | NULL                                                                                                                                                                                                                                                                                       |
| radiozurnal | 17345291 | Zprávy                              | Z domova i ze světa. Sport, Zelená vlna a počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                                                   | 2021-09-30T00:30:00+02:00 | 2021-09-30T00:32:00+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>           | NULL                                                                                                                                                                                                                                                                                       |
| radiozurnal | 17345295 | Zprávy                              | Zpravodajství z Česka i ze světa. Sport, Zelená vlna a předpověď počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                            | 2021-09-30T01:00:00+02:00 | 2021-09-30T01:03:31+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>           | NULL                                                                                                                                                                                                                                                                                       |
| radiozurnal | 17345298 | Volební speciál: debata komentátorů | Hosty jsou novinářka Lída Rakušanová, zástupce šéfredaktora MF Dnes Petr Kolář, politolog Patrik Eichler a komentátorka Marie Bastlová ze serveru Seznam Zprávy. Moderuje Tomáš Pancíř. (repríza) | 2021-09-30T01:05:04+02:00 | 2021-09-30T02:00:00+02:00 | TRUE       | 2    | NULL                                                                                                                          | 5001846 , 5349195 , Tomáš Pancíř , Marie Bastlová , <https://informace.rozhlas.cz/tomas-pancir-5001846> , <https://radiozurnal.rozhlas.cz/marie-bastlova-5349195> , <https://data.rozhlas.cz/api/v2/asset/profile/5001846.jpg>, <https://data.rozhlas.cz/api/v2/asset/profile/5349195.jpg> |
| radiozurnal | 17345302 | Zprávy                              | Zpravodajství z Česka i ze světa. Sport, Zelená vlna a předpověď počasí. O dopravní situaci informujte na bezplatné lince 800 553 553.                                                            | 2021-09-30T02:00:00+02:00 | 2021-09-30T02:04:00+02:00 | FALSE      | 1    | 5997762 , <https://radiozurnal.rozhlas.cz/zpravy-5997762> , <https://data.rozhlas.cz/api/v2/asset/show/5997762.jpg>           | NULL                                                                                                                                                                                                                                                                                       |

## Playlists

The playlist are available only for the Radio Wave station by
`get_wave_playlist` function for the current day and
`get_day_wave_playlist` for a specific day.

``` r
today_wave <- get_wave_playlist()
today_wave %>%
    head() %>% 
    knitr::kable()
```

| since                     |       id | interpret         | interpret\_id | track                         | track\_id | itemcode | files |
|:--------------------------|---------:|:------------------|--------------:|:------------------------------|----------:|:---------|:------|
| 2021-10-01T00:00:43+02:00 | 11703843 | MNDR              |          9312 | Lock and Load ft. Killer Mike |     29078 | 9774990  | NULL  |
| 2021-10-01T00:04:55+02:00 | 11703853 | LXURY & LA PRIEST |          9796 | Show                          |     31119 | 9775248  | NULL  |
| 2021-10-01T00:08:05+02:00 | 11703860 | HOUPACÍ KONĚ      |           627 | Cassidy                       |     60170 | 9777270  | NULL  |
| 2021-10-01T00:13:12+02:00 | 11703868 | FUGAZI            |          5474 | Song No. 1                    |     14918 | 9771158  | NULL  |
| 2021-10-01T00:16:12+02:00 | 11703875 | CHARLI XCX        |          2622 | Boys                          |     43258 | 9776162  | NULL  |
| 2021-10-01T00:18:51+02:00 | 11703881 | BEAT SPACEK       |          9065 | I Wanna Know                  |     27885 | 9774835  | NULL  |

``` r
sept7_wave <- get_day_wave_playlist("2021-09-07")
sept7_wave %>%
    head() %>% 
    knitr::kable()
```

| since                     |       id | interpret          | interpret\_id | track                      | track\_id | itemcode | files |
|:--------------------------|---------:|:-------------------|--------------:|:---------------------------|----------:|:---------|:------|
| 2021-09-07T00:03:44+02:00 | 11536885 | SHURA              |          8695 | Just Once                  |     26311 | 9774643  | NULL  |
| 2021-09-07T00:08:25+02:00 | 11536893 | CRYSTAL STILTS     |          2628 | Love Is A Wave             |     15427 | 9771220  | NULL  |
| 2021-09-07T00:10:18+02:00 | 11536896 | PRIESTS            |         11649 | Suck                       |     40398 | 9775922  | NULL  |
| 2021-09-07T00:14:50+02:00 | 11536905 | RAURY              |          9514 | Devil’s Whisper            |     29972 | 9775101  | NULL  |
| 2021-09-07T00:18:33+02:00 | 11536910 | DJ SHADOW          |          1743 | Bergschrund ft. Nils Frahm |     86791 | 9778111  | NULL  |
| 2021-09-07T00:22:35+02:00 | 11536921 | THE HELIO SEQUENCE |          1969 | October                    |      8361 | 9773269  | NULL  |
