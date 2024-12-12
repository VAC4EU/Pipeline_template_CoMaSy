CoMaSy_schema <- list()

CoMaSy_schema[["$schema"]] <- "http://json-schema.org/draft-07/schema#"
CoMaSy_schema[["type"]] <- "object"
CoMaSy_schema[["title"]] <- "CoMaSy"
CoMaSy_schema[["full title"]] <- "VAC4EU Codebook Management System (CoMaSy)"
CoMaSy_schema[["authors"]] <- "Rosa Gini, Davi Messina, Estel Plana, Brianna Goodale, Timo Brakenhof, Y. Choi, T. Andres Vaz"

main_pipeline_properties <- list()
main_pipeline_properties[["inceptionDatabase"]] <- inceptionDatabase
main_pipeline_properties[["steps"]] <- steps
main_pipeline_properties[["codebooks"]] <- list()
main_pipeline_properties[["indexFile"]] <- list()
main_pipeline_properties[["variables"]] <- list()
main_pipeline_properties[["parameters"]] <- list()
main_pipeline_properties[["configurationFiles"]] <- list()
main_pipeline_properties[["dag"]] <- list()

rm(inceptionDatabase, steps)

main_pipeline <- list()
main_pipeline[["type"]] <- "object"
main_pipeline[["properties"]] <- main_pipeline_properties
main_pipeline[["required"]] <- c("inceptionDatabase", "steps", "codebooks", "indexFile", "variables", "parameters",
                                 "configurationFiles", "dag")

CoMaSy_schema[["properties"]][["pipeline"]] <- main_pipeline

rm(main_pipeline, main_pipeline_properties)
