index <- data.table::data.table(xlsx::read.xlsx(here::here("i_codebooks/00_index.xlsx"), sheetIndex = 1))

test <- lapply(index[, dataset_name][1:18], function(x) {
  test <- data.table::data.table(openxlsx2::read_xlsx(here::here(paste0("i_codebooks/", x, ".xlsx")), sheet = 2, skip_empty_rows = T))
  if ("VarName" %in% colnames(test)) {
    data.table::setnames(test, "VarName", "Varname")
  }
  test[, .(Varname, codebook = x)]
})

test <- data.table::rbindlist(test)
test[, flag := data.table::rowid(Varname) == 1]
test[ , i := .GRP, by = "Varname"]
test[i == 1, ]

add_variable <- function(x, test) {

variables_properties <- list()
variables_properties[["identifier"]] <- x
variables_properties[["name"]] <- unique(test[i == x, Varname])
variables_properties[["generatingCodebook"]] <- test[i == x & flag, codebook]
variables_properties[["codebooksList"]] <- as.list(test[i == x, codebook])
variables_properties[["flowId"]] <- ""

variables_items <- list()
variables_items[["properties"]] <- variables_properties
variables_items[["required"]] <- c("identifier", "name", "generatingCodebook")

return(variables_items)

}

variables <- list()
variables[["items"]] <- lapply(1:max(test[, i]), add_variable, test)
rm(test)
