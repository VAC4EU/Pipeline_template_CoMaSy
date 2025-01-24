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

variables_properties <- list()
variables_properties[["identifier"]] <- x
variables_properties[["name"]][["type"]] <- unique(test[i == x, Varname])
variables_properties[["generatingCodebook"]][["type"]] <- test[i == x & flag, codebook]
variables_properties[["codebooksList"]] <- as.list(test[i == x, codebook])
# TODO to add?
variables_properties[["flowId"]] <- ""

variables_items <- list()
variables_items[["properties"]] <- variables_properties
variables_items[["required"]] <- c("identifier", "name", "generatingCodebook")
rm(variables_properties)

variables <- list()
variables[["items"]] <- variables_items
rm(variables_items)
