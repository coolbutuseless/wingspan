
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Wingspan <img src="man/figures/wingspan.jpg" align="right" width="500" />

<!-- badges: start -->

![](https://img.shields.io/badge/cool-useless-green.svg)
<!-- badges: end -->

The R `{wingspan}` package makes available information about the birds
and bonus cards in the boardgame
[wingspan](https://stonemaiergames.com/games/wingspan/)

Wingspan (the boardgame) was designed by Elizabeth Hargrave, with art by
Natalia Rojas, Ana Maria Martinez Jaramillo, and Beth Sobel

The boardgame is a competitive, medium-weight, card-driven,
engine-building board game, and is absolutely delightful!

This package just provides stats and data on the cards in the box - it
won’t really help you to play the game, and doesn’t include any of the
amazing artwork; it’s just the facts about all birds and bonus cards as
collected by
[TawnyFrogmouth](https://boardgamegeek.com/user/TawnyFrogmouth) at
[BoardGameGeek](https://boardgamegeek.com/boardgame/266192/wingspan)
([original
data](https://boardgamegeek.com/filepage/193164/wingspan-bird-card-bonus-card-spreadsheet)).

<div style="clear:both;" />

## What’s in the box

-   `birds` a data.frame of information about each of the cards in the
    base game and the expansions (europe and oceania)
-   `bonus_cards` information about the cards used to give you a bonus
    at the end of the game (based upon the numbers of birds of different
    types you accumulate during the game)

## Installation

You can install from
[GitHub](https://github.com/coolbutuseless/wingspan) with:

``` r
# install.package('remotes')
remotes::install_github('coolbutuseless/wingspan')
```

### Example Bird Data

<img src="man/figures/barn-swallow.jpg" />

Some of the stats for the 2 birds at the bottom of this image are shown
below.

``` r
library(dplyr)
library(wingspan)

wingspan::birds %>% 
  filter(common_name %in% c('Barn Swallow', 'Peregrine Falcon')) %>%
  select(common_name, scientific_name, points = victory_points, predator, 
         egg_capacity, nest_type, total_food_cost) %>%
  knitr::kable()
```

| common\_name     | scientific\_name | points | predator | egg\_capacity | nest\_type | total\_food\_cost |
|:-----------------|:-----------------|-------:|:---------|--------------:|:-----------|------------------:|
| Barn Swallow     | Hirundo rustica  |      1 | FALSE    |             3 | Wild       |                 1 |
| Peregrine Falcon | Falco peregrinus |      5 | TRUE     |             2 | Platform   |                 2 |

### Example Summary Plot

``` r
library(ggplot2)

ggplot(birds, aes(as.factor(total_food_cost), victory_points)) + 
  geom_boxplot() + 
  theme_bw() + 
  labs(
    x = "Total food cost to play bird card",
    y = "Bird value (Victory points at end of game)",
    title = "Birds with higher total food cost score more victory points"
  ) + 
  scale_y_continuous(breaks = 0:10)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

## Acknowledgements

-   [TawnyFrogmouth](https://boardgamegeek.com/user/TawnyFrogmouth) at
    [BoardGameGeek](https://boardgamegeek.com/boardgame/266192/wingspan)
    for collating and sharing [the
    data](https://boardgamegeek.com/filepage/193164/wingspan-bird-card-bonus-card-spreadsheet)
-   [Stonemeier games](https://stonemaiergames.com/games/wingspan/) for
    releasing such a delicious game
-   R Core for developing and maintaining the language.
-   CRAN maintainers, for patiently shepherding packages onto CRAN and
    maintaining the repository