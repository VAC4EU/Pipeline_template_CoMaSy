add_index_row <- function(name, inputs, outputs) {
  
  index_steps_properties <- list()
  index_steps_properties[["name"]] <- name # string
  index_steps_properties[["inputs"]] <- as.list(unlist(strsplit(inputs, " "))) # string
  index_steps_properties[["outputs"]] <- as.list(unlist(strsplit(outputs, " "))) # string
  
  index_steps <- list()
  index_steps[["properties"]] <- index_steps_properties # object
  rm(index_steps_properties)
  
  # ori_file[["properties"]][["steps"]] <- append(ori_file[["properties"]][["steps"]], list(index_steps))
  # 
  # rm(index_steps)
  
  return(index_steps)
}

index <- data.table::data.table(xlsx::read.xlsx(here::here("i_codebooks/00_index.xlsx"), sheetIndex = 1))
index <- unique(index[, .(step_producing_this_dataset, input_datasets_for_the_step, dataset_name)])

# Check if each step has a single input_datasets_for_the_step
test_index <- unique(index[, .(step_producing_this_dataset, input_datasets_for_the_step)])
if (!identical(nrow(test_index), nrow(unique(index[, .(step_producing_this_dataset)])))) {
  stop()
}
rm(test_index)

index <- index[, .(dataset_name = paste0(dataset_name, collapse = " ")),
               by = c("step_producing_this_dataset", "input_datasets_for_the_step")]

steps_objects <- lapply(1:nrow(index), function(x) {
  add_index_row(index[x, step_producing_this_dataset],
                index[x, input_datasets_for_the_step], index[x, dataset_name])
})

indexFile <- list()
indexFile[["properties"]][["steps"]] <- steps_objects

rm(steps_objects, index, add_index_row)
