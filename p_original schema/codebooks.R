dataModel_properties <- list()
dataModel_properties[["varname"]][["type"]] <- "string"
dataModel_properties[["description"]][["type"]] <- "string"
dataModel_properties[["format"]][["type"]] <- "string"
dataModel_properties[["vocabulary"]][["type"]] <- "string"
dataModel_properties[["notes"]][["type"]] <- "string"

dataModel_items <- list()
dataModel_items[["type"]] <- "object"
dataModel_items[["properties"]] <- dataModel_properties
dataModel_items[["required"]] <- c("varname", "description", "format")

rm(dataModel_properties)

sourceTablesAndVariables_properties <- list()
sourceTablesAndVariables_properties[["tableName"]][["type"]] <- "string"
sourceTablesAndVariables_properties[["variables"]][["type"]] <- "array"
sourceTablesAndVariables_properties[["variables"]][["items"]][["type"]] <- "string"
sourceTablesAndVariables_properties[["retrieved"]][["type"]] <- "boolean"
sourceTablesAndVariables_properties[["calculated"]][["type"]] <- "boolean"
sourceTablesAndVariables_properties[["algorithmId"]][["type"]] <- "string"
sourceTablesAndVariables_properties[["rule"]][["type"]] <- "string"

sourceTablesAndVariables_items <- list()
sourceTablesAndVariables_items[["type"]] <- "object"
sourceTablesAndVariables_items[["properties"]] <- sourceTablesAndVariables_properties

rm(sourceTablesAndVariables_properties)

parameters_properties <- list()
parameters_properties[["name"]][["type"]] <- "string"
parameters_properties[["parameterVariable"]][["type"]] <- "string"
parameters_properties[["values"]][["type"]] <- "array"
parameters_properties[["values"]][["items"]][["type"]] <- "string"
parameters_properties[["configFile"]][["type"]] <- "string"

parameters_items <- list()
parameters_items[["type"]] <- "object"
parameters_items[["properties"]] <- parameters_properties

rm(parameters_properties)

examples_properties <- list()
examples_properties[["inputDataset"]][["type"]] <- "string"
examples_properties[["outputDataset"]][["type"]] <- "string"

examples_items <- list()
examples_items[["type"]] <- "object"
examples_items[["properties"]] <- examples_properties

rm(examples_properties)

metadata_properties <- list()
metadata_properties[["description"]][["type"]] <- "string"
metadata_properties[["unitsOfObservation"]][["type"]] <- "string"
metadata_properties[["codebookReference"]][["type"]] <- "string"
metadata_properties[["observationsDescription"]][["type"]] <- "string"
metadata_properties[["NxUoO"]][["type"]] <- "string"
metadata_properties[["primaryKey"]][["type"]] <- "string"
metadata_properties[["dataModel"]][["type"]] <- "array"
metadata_properties[["dataModel"]][["items"]] <- dataModel_items
metadata_properties[["sourceTablesAndVariables"]][["type"]] <- "array"
metadata_properties[["sourceTablesAndVariables"]][["items"]] <- sourceTablesAndVariables_items
metadata_properties[["parameters"]][["type"]] <- "array"
metadata_properties[["parameters"]][["items"]] <- parameters_items
metadata_properties[["examples"]][["type"]] <- "array"
metadata_properties[["examples"]][["items"]] <- examples_items

rm(dataModel_items, sourceTablesAndVariables_items, parameters_items, examples_items)

codebooks_items_properties <- list()
codebooks_items_properties[["name"]][["type"]] <- "string"
codebooks_items_properties[["name"]][["pattern"]] <- "^D[2-6]_.*"
codebooks_items_properties[["generatorStep"]][["type"]] <- "string"
codebooks_items_properties[["metadata"]][["type"]] <- "object"
codebooks_items_properties[["metadata"]][["properties"]] <- metadata_properties
codebooks_items_properties[["shellTable"]][["type"]] <- "boolean"
rm(metadata_properties)

codebooks_items <- list()
codebooks_items[["type"]] <- "object"
codebooks_items[["properties"]] <- codebooks_items_properties
codebooks_items[["required"]] <- c("name", "generatorStep", "metadata")
rm(codebooks_items_properties)

codebooks <- list()
codebooks[["type"]] <- "array"
codebooks[["items"]] <- codebooks_items
rm(codebooks_items)
