#this source function will run all the other data-raw scripts in order and save the data to a .rda file in the package's data/ directory
sourceDir <- function(path, trace = TRUE, ...) {
  op <- options()
  on.exit(options(op)) # to reset after each
  for (nm in list.files(path, pattern = "^[0-9]_")) {
    if (trace) {
      cat(nm, ":")
    }
    source(file.path(path, nm), ...)
    if (trace) {
      cat("\n")
    }
    options(op)
  }
}

sourceDir(here::here("data-raw"))

# If you wanted to later to and edit one of your datasets, here’s what that workflow would look like:
# 1) Go into data-raw/ and edit your .csv and the corresponding dataset_load.R script for in the data-raw/ folder.
# 2) After you’ve made your changes, make sure you run "run_me.R".
# 3) If your changes affect the variables you’ve used, then don’t forget to update the corresponding Roxygen-commented .R script that lives inside the R/ folder. Run devtools::document() to put those changes into effect.
# 4) Run a Check for good measure with devtools::check(document=FALSE) and finally…
# 5) Go to Build > Install and Restart or devtools::install().
# 6) When your learners re-install the package from GitHub, they’ll have all your updates!
