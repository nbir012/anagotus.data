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
