

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Data for bird cards
#'
#' @format
#' \describe{
#'   \item{common_name           }{English name of bird}
#'   \item{scientific_name       }{Scientific name}
#'   \item{set}{Which game the bonus card is from. Currently one of
#'             'core', 'european', 'oceania', 'swiftstart', 'chinesepromo'}
#'   \item{power_color           }{type of power the bird has. 'white' powers
#'         are enacted when the bird is played. Brown powers are enacted
#'         whenever the bird is activated. Pink powers activate when other
#'         players are having their turn}
#'   \item{power_category        }{High level description of power type}
#'   \item{power_text            }{Full text of power}
#'   \item{predator              }{Logical. Is the bird a predator?}
#'   \item{flocking              }{Logical. Does the bird exhibit flocking?}
#'   \item{bonus_card            }{Logical. Does the bird enable a bonus card using its power?}
#'   \item{victory_points        }{Number of points for this bird}
#'   \item{nest_type             }{Type of nest}
#'   \item{egg_capacity          }{Number of eggs the bird car store}
#'   \item{wingspan              }{Wingspan in cm}
#'   \item{forest                }{Can be positioned in the forest row}
#'   \item{grassland             }{Can be positioned in the grassland row}
#'   \item{wetland               }{Can be positioned in the wetland row}
#'   \item{invertebrate          }{Number of invertebrate food tokens required}
#'   \item{seed                  }{Number of seed food tokens required}
#'   \item{fish                  }{Number of fish food tokens required}
#'   \item{fruit                 }{Number of fruit food tokens required}
#'   \item{rodent                }{Number of rodent food tokens required}
#'   \item{nectar                }{Number of nectar food tokens required}
#'   \item{any_food              }{Number of food tokens of any typerequired}
#'   \item{food_cost_div         }{Not sure}
#'   \item{food_cost_mul         }{Not sure}
#'   \item{total_food_cost       }{Total food tokens required}
#'   \item{anatomist             }{Logical. Does this bird help with this type of bonus card?}
#'   \item{cartographer          }{Logical. Does this bird help with this type of bonus card?}
#'   \item{historian             }{Logical. Does this bird help with this type of bonus card?}
#'   \item{photographer          }{Logical. Does this bird help with this type of bonus card?}
#'   \item{backyard_birder       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{bird_bander           }{Logical. Does this bird help with this type of bonus card?}
#'   \item{bird_counter          }{Logical. Does this bird help with this type of bonus card?}
#'   \item{bird_feeder           }{Logical. Does this bird help with this type of bonus card?}
#'   \item{diet_specialist       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{enclosure_builder     }{Logical. Does this bird help with this type of bonus card?}
#'   \item{falconer              }{Logical. Does this bird help with this type of bonus card?}
#'   \item{fishery_manager       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{food_web_expert       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{forester              }{Logical. Does this bird help with this type of bonus card?}
#'   \item{large_bird_specialist }{Logical. Does this bird help with this type of bonus card?}
#'   \item{nest_box_builder      }{Logical. Does this bird help with this type of bonus card?}
#'   \item{omnivore_expert       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{passerine_specialist  }{Logical. Does this bird help with this type of bonus card?}
#'   \item{platform_builder      }{Logical. Does this bird help with this type of bonus card?}
#'   \item{prairie_manager       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{rodentologist         }{Logical. Does this bird help with this type of bonus card?}
#'   \item{viticulturalist       }{Logical. Does this bird help with this type of bonus card?}
#'   \item{wetland_scientist     }{Logical. Does this bird help with this type of bonus card?}
#'   \item{wildlife_gardener     }{Logical. Does this bird help with this type of bonus card?}
#' }
#'
#' @source \url{https://boardgamegeek.com/filepage/193164/wingspan-bird-card-bonus-card-spreadsheet}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"birds"



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Data for bonus cards
#'
#' @format
#' \describe{
#'   \item{name}{Name. This corresponds to the equivalently named column
#'         in the \code{birds} data}
#'   \item{set}{Which game the bonus card is from. Currently one of
#'             'core', 'european' and 'oceania'}
#'   \item{automa}{Logical.  Is this card used when playing with the automa}
#'   \item{condition}{A short description of when this bonus applies}
#'   \item{explanatory_text}{A longer explanation of when this bonus applies}
#'   \item{victory_points}{The number of victory points awarded if the bonus
#'         conditions are met at the end of the game}
#'   \item{percent}{What percent of bird cards match the bonus condition?}
#' }
#'
#' @source \url{https://boardgamegeek.com/filepage/193164/wingspan-bird-card-bonus-card-spreadsheet}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"bonus_cards"
