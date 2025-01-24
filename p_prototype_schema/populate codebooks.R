add_dm_properties <- function(x, real_cb_datamodel) {
  
  dataModel_properties <- list()
  dataModel_properties[["varname"]] <- real_cb_datamodel[x, VarName] # string
  dataModel_properties[["description"]] <- real_cb_datamodel[x, Description] # string
  dataModel_properties[["format"]] <- real_cb_datamodel[x, Format] # string
  dataModel_properties[["vocabulary"]] <- real_cb_datamodel[x, Vocabulary] # string
  dataModel_properties[["notes"]] <- real_cb_datamodel[x, Notes.and.examples] # string
  
  dataModel_items <- list()
  dataModel_items[["properties"]] <- dataModel_properties
  dataModel_items[["required"]] <- c("varname", "description", "format")
  
  return(dataModel_items)
  
}

# add_dm_properties(ori_file, varname, description, format, vocabulary, notes)

add_stav_properties <- function(x, real_cb_datamodel) {
  
  sourceTablesAndVariables_properties <- list()
  # TODO how to retrieve?
  sourceTablesAndVariables_properties[["tableName"]] <- "tablename" # string
  sourceTablesAndVariables_properties[["variables"]][["items"]] <- "variables" # string
  sourceTablesAndVariables_properties[["retrieved"]] <- real_cb_datamodel[x, Retrieved] # boolean
  sourceTablesAndVariables_properties[["calculated"]] <- real_cb_datamodel[x, Calculated] # boolean
  sourceTablesAndVariables_properties[["algorithmId"]] <- real_cb_datamodel[x, Algorithm_id] # string
  sourceTablesAndVariables_properties[["rule"]] <- real_cb_datamodel[x, Rule] # string
  
  sourceTablesAndVariables_items <- list()
  sourceTablesAndVariables_items[["properties"]] <- sourceTablesAndVariables_properties
  
  return(sourceTablesAndVariables_items)
  
}

# add_stav_properties(ori_file, tablename, variables, retrieved, calculated, algorithm_Id, rule)

add_parameters_properties <- function(x, real_cb_parameters, real_cb_datamodel) {
  
  parameters_properties <- list()
  parameters_properties[["name"]] <- real_cb_parameters[x, parameter.in.the.variable.name] # string
  # TODO change string to array 
  parameters_properties[["parameterVariable"]] <- as.list(real_cb_datamodel[real_cb_datamodel[, Parameters] %in% parameters_properties[["name"]], VarName]) # string
  parameters_properties[["values"]][["items"]] <- real_cb_parameters[x, values] # string
  # TODO ask name of macro
  parameters_properties[["configFile"]] <- "" # string
  
  parameters_items <- list()
  parameters_items[["properties"]] <- parameters_properties
  
  return(parameters_items)
}

# add_parameters_properties(ori_file, name, parameterVariable, values, configFile)

add_examples_properties <- function(example_dfs) {
  
  examples_properties <- list()
  examples_properties[["inputDataset"]] <- example_dfs[1:length(example_dfs) - 1] # string
  examples_properties[["outputDataset"]] <- example_dfs[length(example_dfs)] # string
  
  examples_items <- list()
  examples_items[["properties"]] <- examples_properties
  
  return(examples_items)
  
}

# add_examples_properties(ori_file, inputDataset, outputDataset)

add_codebook <- function(index_file, real_cb_example, real_cb_parameters, real_cb_datamodel, real_cb_metadata, example_dfs) {
  
  metadata_properties <- list()
  metadata_properties[["description"]] <- real_cb_metadata[medatata_name == "Content of the dataset", metadata_content] # string
  metadata_properties[["unitsOfObservation"]] <- real_cb_metadata[medatata_name == "Unit of observation", metadata_content] # string
  metadata_properties[["codebookReference"]] <- real_cb_metadata[medatata_name == real_cb_metadata[medatata_name == "Dataset where the list of UoOs is fully listed and with 1 record per UoO", metadata_content], metadata_content] # string
  metadata_properties[["observationsDescription"]] <- real_cb_metadata[medatata_name == "How many observations per UoO", metadata_content] # string
  metadata_properties[["NxUoO"]] <- real_cb_metadata[medatata_name == "NxUoO", metadata_content] # string
  #TODO metadata_properties[["Variables capturing the UoO"]]
  metadata_properties[["primaryKey"]] <- tstrsplit(real_cb_metadata[medatata_name == "Primary key", metadata_content], " ") # string
  metadata_properties[["dataModel"]][["items"]] <- lapply(1:nrow(real_cb_datamodel), function(x) {
    add_dm_properties(x, real_cb_datamodel)
  }) # object
  metadata_properties[["sourceTablesAndVariables"]][["items"]] <- lapply(1:nrow(real_cb_datamodel), function(x) {
    add_stav_properties(x, real_cb_datamodel)
  }) # object
  metadata_properties[["parameters"]][["items"]] <- lapply(1:nrow(real_cb_parameters), function(x) {
    add_parameters_properties(x, real_cb_parameters, real_cb_datamodel)
  }) # object
  metadata_properties[["examples"]][["items"]] <- add_examples_properties(example_dfs) # object
  
  codebooks_items_properties <- list()
  codebooks_items_properties[["name"]] <- real_cb_metadata[medatata_name == "Name of the dataset", metadata_content] # string
  # TODO
  codebooks_items_properties[["name"]][["pattern"]] <- "^D[2-6]_.*"
  
  index_file_filtered <- index_file[dataset_name == codebooks_items_properties[["name"]][[1]], ]
  codebooks_items_properties[["generatorStep"]] <- index_file_filtered[, step_producing_this_dataset] # string
  codebooks_items_properties[["metadata"]][["properties"]] <- metadata_properties # object
  # TODO
  codebooks_items_properties[["shellTable"]] <- "" # boolean
  rm(metadata_properties)
  
  codebooks_items <- list()
  codebooks_items[["type"]] <- "object"
  codebooks_items[["properties"]] <- codebooks_items_properties
  codebooks_items[["required"]] <- c("name", "generatorStep", "metadata")
  rm(codebooks_items_properties)
  
  ori_file <- list()
  ori_file[["type"]] <- "array"
  ori_file[["items"]] <- append(ori_file[["items"]], codebooks_items)
  rm(codebooks_items)
  
  return(ori_file)
  
}

is_empty_row <- data.table::data.table(openxlsx2::wb_load(here::here("i_codebooks/D3_TD_condition.xlsx")) %>%
  openxlsx2::wb_to_df(col_names = F, sheet = "Examples"))
is_empty_row <- data.table::data.table(!is.na(is_empty_row[, 1]))
setnames(is_empty_row, colnames(is_empty_row), "is_empty")
is_empty_row[, group_id := data.table::fifelse(is_empty != data.table::shift(is_empty, fill = F), 1, 0)]
is_empty_row[, group_id := cumsum(group_id)]
is_empty_row[, row_id := .I]

data.table::data.table(openxlsx2::wb_load(here::here("i_codebooks/D3_TD_condition.xlsx")) %>%
                         openxlsx2::wb_to_df(sheet = "Examples", rows = 1:10))

example_dfs <- list()
for (grp in 1:is_empty_row[, max(group_id)]) {
  if (isTRUE(unique(is_empty_row[group_id == grp, is_empty]))) {
    tmp <- data.table::data.table(openxlsx2::wb_load(here::here("i_codebooks/D3_TD_condition.xlsx")) %>%
                                    openxlsx2::wb_to_df(sheet = "Examples",
                                                        rows = is_empty_row[group_id == grp, min(row_id)]:is_empty_row[group_id == grp, max(row_id)]))
    example_dfs <- append(example_dfs, list(tmp))
  }
}

all_codebooks <- setdiff(list.files(here::here("i_codebooks")), "00_index.xlsx")
all_codebooks <- all_codebooks[!grepl("^~", all_codebooks)]

codebooks <- lapply(all_codebooks, function(x) {
  excel_file <- here::here("i_codebooks", all_codebooks[1])
  
  print(x)
  
  real_cb_example <- data.table::data.table(xlsx::read.xlsx(excel_file, sheetIndex = 4))
  real_cb_parameters <- data.table::data.table(openxlsx2::read_xlsx(excel_file, sheet = 3, check_names = T))
  real_cb_datamodel <- data.table::data.table(xlsx::read.xlsx(excel_file, sheetIndex = 2))
  real_cb_metadata <- data.table::data.table(xlsx::read.xlsx(excel_file, sheetIndex = 1))
  index_file <- data.table::data.table(xlsx::read.xlsx(here::here("i_codebooks/00_index.xlsx"), sheetIndex = 1))
  
  add_codebook(index_file, real_cb_example, real_cb_parameters, real_cb_datamodel, real_cb_metadata, example_dfs)
})