# Load required packages
#install.packages("tidyverse")
library(tidyverse)

# Define function
split_scientific_name <- function(df, column = "") {
  column_sym <- sym(column)

  df |>
    mutate(
      match = str_match(
        !!column_sym,
        "^([A-Z][a-z]+)(?:\\s([a-z0-9_]+))?(?:\\s*\\(?([A-Za-z\\.\\s]+),\\s*(\\d{4})\\)?)?"
      ),
      v_genus = ifelse(!is.na(match[, 2]), match[, 2], NA_character_),
      v_species = ifelse(!is.na(match[, 3]), match[, 3], NA_character_),
      v_authority_name = ifelse(!is.na(match[, 4]), match[, 4], NA_character_),
      v_authority_date = ifelse(!is.na(match[, 5]), match[, 5], NA_character_)
    ) |>
    select(-match)
}

# Data processing
df_nzac_raw <- readr::read_csv(here::here(
  "data-raw",
  "2025_nzac_digitised_specimen_data.csv"
)) |>
  janitor::clean_names() |>
  unite(
    species,
    taxon_name:taxon_note,
    sep = " ",
    remove = FALSE,
    na.rm = TRUE
  ) |>
  separate_wider_delim(
    col = neil_guess_coordinates,
    names = c("decimal_latitude", "decimal_longitude"),
    delim = ", "
  ) |>
  split_scientific_name("species") |>
  select(
    institution_code = repository,
    catalog_number = nzac_accession_number,
    recorded_by = collectors,
    year,
    month,
    decimal_latitude,
    decimal_longitude,
    location = locality,
    generic_name = v_genus,
    specific_name = v_species
  ) |>
  unite("species", generic_name, specific_name, sep = " ", remove = FALSE)

df_nhm_raw <- readr::read_csv(here::here(
  "data-raw",
  "2025_nhm_digitised_specimen_data.csv"
)) |>
  janitor::clean_names() |>
  separate_wider_delim(
    col = neil_guess_coordinates,
    names = c("decimal_latitude", "decimal_longitude"),
    delim = ", "
  ) |>
  split_scientific_name("neil_guess_accepted_name") |>
  mutate(
    collector_cleaned = case_when(
      is.na(collector) ~ NA_character_,
      collector == "coll. // E.Fairburn." ~ "E.F. Fairburn",
      collector == "Marshall." ~ "Marshall",
      collector == "H. Simmonds." ~ "H. Simmonds",
      collector == "E.S. Gourlay" ~ "E.S. Gourlay",
      collector == ".Seymour." ~ "Seymour",
      collector == "Illegible" ~ "Illegible",
      collector == "O'connor" ~ "O'Connor",
      collector == "E.Fairburn." ~ "E.F. Fairburn",
      collector == "G.V. Hudson (C.E. Clarke)." ~ "G.V. Hudson; C.E. Clarke",
      collector == "E.S.Gourlay" ~ "E.S. Gourlay",
      collector == "Helms" ~ "Helms",
      collector == "G.V. Hudson" ~ "G.V. Hudson",
      collector == "Stella Hudson" ~ "S. Hudson",
      collector == "G. Howes" ~ "G. Howes",
      collector == "C. E. Clarke" ~ "C.E. Clarke",
      collector == "J. S. Hood" ~ "J.S. Hood",
      collector == "E. Fairburn // gen G.V. Hudson" ~
        "E.F. Fairburn; G.V. Hudson",
      collector == "Gourlay // per G.V. Hudson" ~ "E.S. Gourlay; G.V. Hudson",
      collector == "H. Hamilton" ~ "H. Hamilton",
      collector == "A.C. O'Connor" ~ "A.C. O'Connor",
      collector == "O'Connor" ~ "O'Connor",
      collector == "Fide Sandager" ~ "Fide Sandager",
      TRUE ~ collector
    )
  ) |>
  mutate(
    clean_date = parse_date_time(clean_date, orders = c("dmy", "my", "y")),
    day = day(clean_date),
    month = month(clean_date),
    v_year = year(clean_date)
  ) |>
  select(
    institution_code = institution,
    catalog_number = barcode,
    recorded_by = collector_cleaned,
    year = v_year,
    month,
    day,
    decimal_latitude,
    decimal_longitude,
    location,
    generic_name = v_genus,
    specific_name = v_species
  ) |>
  unite("species", generic_name, specific_name, sep = " ", remove = FALSE)

df_lunz_raw <- readr::read_csv(here::here(
  "data-raw",
  "2007_lunz_digitised_specimen_data.csv"
)) |>
  janitor::clean_names() |>
  filter(genus_name == "Anagotus") |>
  mutate(institution_code = "LUNZ") |>
  mutate(
    date_collected1 = parse_date_time(date_collected1, orders = c("dmy", "my", "y")),
    day = day(date_collected1),
    month = month(date_collected1),
    year = year(date_collected1)
  ) |>
  select(
    institution_code,
    catalog_number = accession_number,
    recorded_by = collected_by,
    year,
    month,
    day,
    decimal_latitude = latitude,
    decimal_longitude = longitude,
    location,
    generic_name = genus_name,
    specific_name = species_name
  ) |>
  unite("species", generic_name, specific_name, sep = " ", remove = FALSE) %>% 
  mutate(decimal_latitude = as.character(decimal_latitude),
         decimal_longitude = as.character(decimal_longitude))

df_cmnz_raw <- readr::read_csv(here::here(
  "data-raw",
  "20240320_cmnz_digitised_specimen_data.csv"
)) |>
  janitor::clean_names() |>
  mutate(institution_code = "CMNZ") |>
  separate(field_coll_date, into = c("field_coll_date", "field_coll_date2"), sep = "-") |>
  separate(classification, into = c("generic_name", "specific_name"), sep = "/", remove = FALSE) |>
  mutate(
    field_coll_date = parse_date_time(field_coll_date, orders = c("dmy", "my", "y")),
    day = day(field_coll_date),
    month = month(field_coll_date),
    year = year(field_coll_date)
  ) |>
  select(
    institution_code,
    catalog_number = system_id,
    recorded_by = field_coll_person,
    year,
    month,
    day,
    decimal_latitude = latitude,
    decimal_longitude = longitude,
    location = field_coll_place_description,
    generic_name,
    specific_name
  ) |>
  unite("species", generic_name, specific_name, sep = " ", remove = FALSE) %>%
  mutate(
    catalog_number = as.character(catalog_number),
    decimal_latitude = as.character(decimal_latitude),
    decimal_longitude = as.character(decimal_longitude)
  )

df_monz_raw <- readr::read_csv(here::here(
  "data-raw",
  "2025_monz_digitised_specimen_data.csv"
)) |>
  janitor::clean_names() |>
  unite(
    species,
    taxon_name:taxon_note,
    sep = " ",
    remove = FALSE,
    na.rm = TRUE
  ) |>
  separate_wider_delim(
    col = neil_guess_coordinates,
    names = c("decimal_latitude", "decimal_longitude"),
    delim = ", "
  ) |>
  split_scientific_name("species") |>
  select(
    institution_code = institution,
    catalog_number = barcode,
    recorded_by = collectors,
    year,
    month,
    decimal_latitude,
    decimal_longitude,
    location = locality,
    generic_name = v_genus,
    specific_name = v_species
  ) |>
  unite("species", generic_name, specific_name, sep = " ", remove = FALSE)

# Combine datasets
df_anagotus <- bind_rows(df_nzac_raw, df_nhm_raw, df_cmnz_raw, df_lunz_raw, df_monz_raw) %>%
  mutate(
    decimal_latitude = as.double(decimal_latitude),
    decimal_longitude = as.double(decimal_longitude)
  )

# Save to .rda
usethis::use_data(df_anagotus, overwrite = TRUE)

# If you wanted to later to and edit one of your datasets, here’s what that workflow would look like:
# 1) Go into data-raw/ and edit your .csv and the corresponding dataset_load.R script for in the data-raw/ folder.
# 2) After you’ve made your changes, make sure you re-run usethis::use_data(<your-dataset>, overwrite = TRUE).
# 3) If your changes affect the variables you’ve used, then don’t forget to update the corresponding Roxygen-commented .R script that lives inside the R/ folder. Run devtools::document() to put those changes into effect.
# 4) Run a Check for good measure with devtools::check(document=FALSE) and finally…
# 5) Go to Build > Install and Restart or devtools::install().
# 6) When your learners re-install the package from GitHub, they’ll have all your updates!
