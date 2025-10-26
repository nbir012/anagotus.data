#' Label data of Anagotus spp. specimens located in museum collections 
#'
#' Anagotus is a genus of large, flightless weevils (Coleoptera: Curculionidae) endemic to New Zealand. The dataset contains label data for 1,396 Anagotus specimens located in museum collections in New Zealand and overseas. The variables are:  
#'
#' @format A tibble with 1,396 rows and 12 variables:
#' \describe{
#'   \item{institution_code}{chr Code for the institution housing the specimen.}
#'   \item{catalog_number}{chr The unique barcode identifier for each specimen. This corresponds to a physical label on the specimen.} 
#'   \item{recorded_by}{chr The collector of the specimen, if known.}
#'   \item{year}{num The year the specimen was collected}
#'   \item{month}{num The month the specimen was collected}
#'   \item{day}{num The day the specimen was collected}
#'   \item{decimal_latitude}{chr The latitude in decimal degrees where the specimen was collected. This is often estimated from a place name.}
#'   \item{decimal_longitude}{chr The longitude in decimal degrees where the specimen was collected. This is often estimated from a place name.}
#'   \item{location}{chr The textual description of the location where the specimen was collected.}
#'   \item{species}{chr The latin binomial or tag name of the specimen.}
#'   \item{generic_name}{chr The genus name of the specimen.}
#'   \item{specific_name}{chr The species name of the specimen.}
#' }
#' @source {Neil Birrell} Collected from museum collections and specimen labels.
"df_anagotus"