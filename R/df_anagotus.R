#' Label data of Anagotus spp. specimens located in museum collections
#'
#' Anagotus is a genus of large, flightless weevils (Coleoptera: Curculionidae) endemic to New Zealand. The dataset contains label data for Anagotus specimens located in museum collections in New Zealand and overseas. The variables are:
#'
#' @format ## `anagotus.data`
#' A tibble with 2,147 rows and 12 variables:
#' \describe{
#'   \item{institution_code}{chr Code for the institution housing the specimen. Codes have been standardised as:
#' NZAC = New Zealand Arthropod Collection, New Zealand;
#' MONZ = Museum of New Zealand Te Papa Tongarewa, New Zealand;
#' AK = Auckland Museum, New Zealand; CMNZ = Canterbury Museum, New Zealand;
#' OMNZ = Otago Museum, New Zealand;
#' NHMUK = Natural History Museum, London, United Kingdom;
#' LUNZ = Lincoln University Collection, New Zealand;
#' ANIC = Australian National Insect Collection, Canberra, Australia;
#' FRNZ = Forest Research Institute (now BSI - Scion), New Zealand.}
#'   \item{catalog_number}{chr The unique barcode identifier for each specimen. This corresponds to a physical label on the specimen, or, in the case of tfbis dataset, a unique code identifying when information was digitised (NUMBCYYMM, where C=century, YY = year, MM = month, NUMB = number).}
#'   \item{recorded_by}{chr The collector of the specimen, if known.}
#'   \item{year}{num The year the specimen was collected, if known.}
#'   \item{month}{num The month the specimen was collected, if known.}
#'   \item{day}{num The day the specimen was collected, if known.}
#'   \item{decimal_latitude}{chr The latitude in decimal degrees where the specimen was collected. This is often estimated from a place name.}
#'   \item{decimal_longitude}{chr The longitude in decimal degrees where the specimen was collected. This is often estimated from a place name.}
#'   \item{location}{chr The textual description of the location where the specimen was collected.}
#'   \item{species}{chr The latin binomial or tag name of the specimen. In some cases, where the specific epithet is indicated by an *, these are manuscript names from Willy Kuschel and should not be used in formal publications without checking with a taxonomic expert.}
#'   \item{generic_name}{chr The genus name of the specimen.}
#'   \item{specific_name}{chr The species name of the specimen. In some cases, where the specific epithet is indicated by an *, these are manuscript names from Willy Kuschel and should not be used in formal publications without checking with a taxonomic expert.}
#'   \item{data_origin}{chr How the data was sourced. The values are:
#' nwb_<institution_code>_digitised = data digitised by Neil Birrell from physical specimen labels in museum collections;
#' curator_database_checked = data downloaded from museum collection databases by a museum curators. This is the case for CMNZ which was undergoing renovations at the time and a physical visit was not possible.
#' tfbis_<institution_code>_digitised = data downloaded from the Terrestrial and Freshwater Biodiversity Information System (TFBIS) managed by Manaaki Whenua - Landcare Research, New Zealand. This includes a variety of collections. In the case of NZAC it may contain duplicates of what has been digitised by Neil Birrell. As there was no unique identifier attached to specimens for the tfbis data, it is not possible to cross check for duplicates. If this is important to you, you should use only the nwb_<institution_code>_digitised values which were comprehensive checks by one researcher.}
#'   \item{df_origin}{chr The dataframe where this value originated from. This will correspond to a particular csv which can be found in the data-raw folder.}
#'   \item{microhabitat}{chr The habitat or microhabitat associated with the specimen, as per the label data.}
#' }
#' @source {Neil Birrell} Collected from museum collections and specimen labels.
#' @source [Manaaki Whenua - Landcare Research, New Zealand. Terrestrial and Freshwater Biodiversity Information System (TFBIS) Large Weevils.](https://www.landcareresearch.co.nz/tools-and-resources/collections/new-zealand-arthropod-collection-nzac/tfbis-funded-specimen-information/large-weevils)
"df_anagotus"
