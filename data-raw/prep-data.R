
suppressPackageStartupMessages({
  library(magrittr)
  library(dplyr)
  library(tidyr)
  library(purrr)
  library(readxl)
})

corefile <- here::here("data-raw/wingspan-card-lists-20201118.xlsx")
core1 <- readxl::read_xlsx(corefile, sheet = 1) # all
core2 <- readxl::read_xlsx(corefile, sheet = 2) # original + swift start
core3 <- readxl::read_xlsx(corefile, sheet = 3) # euro
core4 <- readxl::read_xlsx(corefile, sheet = 4) # oceania
core5 <- readxl::read_xlsx(corefile, sheet = 5) # chinese
core6 <- readxl::read_xlsx(corefile, sheet = 6) #bonus

trans_file <- here::here("data-raw/Wingspan Bird List ENG-NED-DEU.xlsx")
translations <- readxl::read_xlsx(trans_file)


birds <- core1 %>%
  slice(-c(1, 2)) %>%
  rename(set = ...3) %>%
  mutate(
    set = if_else(set == 'originalcore', 'core', set)
  )


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Which columns have an X in them? These are logical columns.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
xcols <- birds %>%
  map_lgl(~all(is.na(.x) | .x == 'X')) %>% keep(isTRUE) %>% names()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# convert columns to logical
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
birds %<>%
  mutate(across(xcols, ~!is.na(.x) & .x == 'X'))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# convert some NAs to zeros in integer columns
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
birds %<>%
  mutate(across(Invertebrate:`Wild (food)`,
                ~if_else(is.na(.x), 0L, as.integer(.x))))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Convert wingspan to numeric. Wingspan will be NA for flightless birds
# which are currently marked as "*"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
birds %<>%
  mutate(
    Wingspan = readr::parse_number(Wingspan, na = '*')
  )


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# for some reason total food cost wasn't correct in the original spreadsheet
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
birds %<>%
  mutate(
    `Total food cost` = if_else(set == 'oceania',
                                Seed + Fish + Fruit + Rodent + Nectar,
                                as.integer(`Total food cost`))
  )

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Tidy other NAs in text which would be better as blanks
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
birds %<>%
  tidyr::replace_na(list(`Power text` = ''))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# fast tidy of column names to be a little more R standard
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(birds) <- gsub('\\s+', '_', tolower(trimws(colnames(birds))))

birds %<>% rename(
  power_category = powercategory,
  food_cost_div  = `/_(food_cost)`,
  food_cost_mul  = `*_(food_cost)`,
  any_food       = `wild_(food)`,
  power_color    = color
)


glimpse(birds)



bonus_cards <- core6

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# fast tidy of column names to be a little more R standard
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
colnames(bonus_cards) <- gsub('\\s+', '_', tolower(trimws(colnames(bonus_cards))))

bonus_cards %<>% rename(
  percent        = `%`,
  victory_points = vp,
  set            = expansion
)

bonus_cards %<>% mutate(
  automa = !is.na(automa) & automa == 'X',
  percent = readr::parse_number(percent, na = "-")
)


glimpse(bonus_cards)




usethis::use_data(birds, bonus_cards, internal = FALSE, overwrite = TRUE, compress = 'xz')



