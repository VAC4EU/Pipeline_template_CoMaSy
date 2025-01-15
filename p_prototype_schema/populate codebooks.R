add_dm_properties <- function(ori_file, varname, description, format, vocabulary, notes) {
  
  dataModel_properties <- list()
  dataModel_properties[["varname"]] <- varname # string
  dataModel_properties[["description"]] <- description # string
  dataModel_properties[["format"]] <- format # string
  dataModel_properties[["vocabulary"]] <- vocabulary # string
  dataModel_properties[["notes"]] <- notes # string
  
  dataModel_items <- list()
  dataModel_items[["properties"]] <- dataModel_properties
  dataModel_items[["required"]] <- c("varname", "description", "format")
  
  return(dataModel_items)
  
}

add_dm_properties(ori_file, varname, description, format, vocabulary, notes)

add_stav_properties <- function(ori_file, tablename, variables, retrieved, calculated, algorithm_Id, rule) {
  
  sourceTablesAndVariables_properties <- list()
  sourceTablesAndVariables_properties[["tableName"]] <- tablename # string
  sourceTablesAndVariables_properties[["variables"]][["items"]] <- variables # string
  sourceTablesAndVariables_properties[["retrieved"]] <- retrieved # boolean
  sourceTablesAndVariables_properties[["calculated"]] <- calculated # boolean
  sourceTablesAndVariables_properties[["algorithmId"]] <- algorithm_Id # string
  sourceTablesAndVariables_properties[["rule"]] <- rule # string
  
  sourceTablesAndVariables_items <- list()
  sourceTablesAndVariables_items[["properties"]] <- sourceTablesAndVariables_properties
  
  return(sourceTablesAndVariables_items)
  
}

add_stav_properties(ori_file, tablename, variables, retrieved, calculated, algorithm_Id, rule)

add_parameters_properties <- function(ori_file, name, parameterVariable, values, configFile) {
  
  parameters_properties <- list()
  parameters_properties[["name"]] <- name # string
  parameters_properties[["parameterVariable"]] <- parameterVariable # string
  parameters_properties[["values"]][["items"]] <- values # string
  parameters_properties[["configFile"]] <- configFile # string
  
  parameters_items <- list()
  parameters_items[["properties"]] <- parameters_properties
  
  return(parameters_items)
}

add_parameters_properties(ori_file, name, parameterVariable, values, configFile)

add_examples_properties <- function(ori_file, inputDataset, outputDataset) {
  
  examples_properties <- list()
  examples_properties[["inputDataset"]] <- inputDataset # string
  examples_properties[["outputDataset"]] <- outputDataset # string
  
  examples_items <- list()
  examples_items[["properties"]] <- examples_properties
  
  return(examples_items)
  
}

add_examples_properties(ori_file, inputDataset, outputDataset)

add_codebook <- function(ori_file, codebook_name, generatorStep, is_shellTable, description, UoO, codebookReference,
                         observationsDescription, NxUoO, primaryKey, dataModel_items, sourceTablesAndVariables_items,
                         parameters_items, examples_items) {
  
  real_cb_metadata <- data.table::data.table(xlsx::read.xlsx("i_codebooks/D3_TD_condition.xlsx", sheetIndex = 1))
  
  metadata_properties <- list()
  metadata_properties[["description"]] <- real_cb_metadata[medatata_name == "Content of the dataset", metadata_content] # string
  metadata_properties[["unitsOfObservation"]] <- real_cb_metadata[medatata_name == "Unit of observation", metadata_content] # string
  metadata_properties[["codebookReference"]] <- real_cb_metadata[medatata_name == "real_cb_metadata[medatata_name == "Unit of observation", metadata_content]", metadata_content] # string
  #TODO
  metadata_properties[["observationsDescription"]] <- observationsDescription # string
  metadata_properties[["NxUoO"]] <- real_cb_metadata[medatata_name == "How many observations per UoO", metadata_content] # string
  metadata_properties[["primaryKey"]] <- real_cb_metadata[medatata_name == "Primary key", metadata_content] # string
  metadata_properties[["dataModel"]][["items"]] <- dataModel_items # object
  metadata_properties[["sourceTablesAndVariables"]][["items"]] <- sourceTablesAndVariables_items # object
  metadata_properties[["parameters"]][["items"]] <- parameters_items # object
  metadata_properties[["examples"]][["items"]] <- examples_items # object
  
  rm(dataModel_items, sourceTablesAndVariables_items, parameters_items, examples_items)
  
  codebooks_items_properties <- list()
  codebooks_items_properties[["name"]] <- real_cb_metadata[medatata_name == "Name of the dataset", metadata_content] # string
  codebooks_items_properties[["name"]][["pattern"]] <- "^D[2-6]_.*"
  # TODO
  codebooks_items_properties[["generatorStep"]] <- generatorStep # string
  codebooks_items_properties[["metadata"]][["properties"]] <- metadata_properties # object
  # TODO
  codebooks_items_properties[["shellTable"]] <- is_shellTable # boolean
  rm(metadata_properties)
  
  codebooks_items <- list()
  codebooks_items[["type"]] <- "object"
  codebooks_items[["properties"]] <- codebooks_items_properties
  codebooks_items[["required"]] <- c("name", "generatorStep", "metadata")
  rm(codebooks_items_properties)
  
  ori_file[["type"]] <- "array"
  ori_file[["items"]] <- append(ori_file[["items"]], codebooks_items)
  rm(codebooks_items)
  
  return(ori_file)
  
}

codebooks <- list()
add_codebook(ori_file, codebook_name, generatorStep, is_shellTable, description, UoO, codebookReference,
             observationsDescription, NxUoO, primaryKey, dataModel_items, sourceTablesAndVariables_items,
             parameters_items, examples_items)

real_cb_metadata <- data.table::data.table(xlsx::read.xlsx("i_codebooks/D3_clean_spells.xlsx", sheetIndex = 1))
index <- unique(index[, .(step_producing_this_dataset, input_datasets_for_the_step, dataset_name)])
