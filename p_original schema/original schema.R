original_schema <- jsonlite::fromJSON(
'{
"$schema": "http://json-schema.org/draft-07/schema#",
"type": "object",
"title": "CoMaSy",
"full title": "VAC4EU Codebook Management System (CoMaSy)",
"authors":"Rosa Gini, Davi Messina, Estel Plana, Brianna Goodale, Timo Brakenhof, Y. Choi, T. Andres Vaz",
"properties": {
"pipeline": {
"type": "object",
"properties": {
"inceptionDatabase": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string" },
"description": { "type": "string" },
"dataModel": {
"type": "array",
"items": {
"type": "object",
"properties": {
"flow_id": { "type": "string" } ,
"database": { "type": "string" },
"file_name": { "type": "string" },
"description": { "type": "string" },
"admissibleValues": {
"type": "array",
"items": { "type": "string" }
},
"comments": { "type": "string" }
},
"required": ["name", "description", "format"]
}
}
},
"required": ["name", "description", "dataModel"]
}
},
"steps": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string" },
"partialOrdering": { "type": "string" },
"input": {
"type": "object",
"properties": {
"inceptionDatabase": {
"type": "array",
"items": { "type": "string" }
},
"codebooks": {
"type": "array",
"items": { "type": "string" }
}
}
},
"output": {
"type": "array",
"items": { "type": "string" }
},
"programCodeFiles": {
"type": "array",
"items": { "type": "string" }
}
},
"required": ["name", "input", "output", "programCodeFiles"]
}
},
"codebooks": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string", "pattern": "^D[2-6]_.*" },
"generatorStep": { "type": "string" },
"metadata": {
"type": "object",
"properties": {
"description": { "type": "string" },
"unitsOfObservation": { "type": "string" },
"codebookReference": { "type": "string" },
"observationsDescription": { "type": "string" },
"NxUoO": { "type": "string" },
"primaryKey": { "type": "string" },
"dataModel": {
"type": "array",
"items": {
"type": "object",
"properties": {
"varname": { "type": "string" },
"description": { "type": "string" },
"format": { "type": "string" },
"vocabulary": { "type": "string" },
"notes": { "type": "string" }
},
"required": ["varname", "description", "format"]
}
},
"sourceTablesAndVariables": {
"type": "array",
"items": {
"type": "object",
"properties": {
"tableName": { "type": "string" },
"variables": {
"type": "array",
"items": { "type": "string" }
},
"retrieved": { "type": "boolean" },
"calculated": { "type": "boolean" },
"algorithmId": { "type": "string" },
"rule": { "type": "string" }
}
}
},
"parameters": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string" },
"parameterVariable": { "type": "string" },
"values": {
"type": "array",
"items": { "type": "string" }
},
"configFile": { "type": "string" }
}
}
},
"examples": {
"type": "array",
"items": {
"type": "object",
"properties": {
"inputDataset": { "type": "string" },
"outputDataset": { "type": "string" }
}
}
}
}
},
"shellTable": { "type": "boolean" }
},
"required": ["name", "generatorStep", "metadata"]
}
},
"indexFile": {
"type": "object",
"properties": {
"steps": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string" },
"inputs": {
"type": "array",
"items": { "type": "string" }
},
"outputs": {
"type": "array",
"items": { "type": "string" }
}
}
}
}
}
},
"variables": {
"type": "array",
"items": {
"type": "object",
"properties": {
"identifier": { "type": "string" },
"name": { "type": "string" },
"generatingCodebook": { "type": "string" },
"codebooksList": {
"type": "array",
"items": { "type": "string" }
},
"flowId": { "type": "string" }
},
"required": ["identifier", "name", "generatingCodebook"]
}
},
"parameters": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string" },
"parameterVariable": { "type": "string" },
"values": {
"type": "array",
"items": { "type": "string" }
},
"configFile": { "type": "string" }
}
}
},
"configurationFiles": {
"type": "array",
"items": {
"type": "object",
"properties": {
"name": { "type": "string" },
"fileNames": {
"type": "array",
"items": { "type": "string" }
},
"parameterVariables": {
"type": "array",
"items": { "type": "string" }
}
},
"required": ["name", "fileNames", "parameterVariables"]
}
},
"dag": {
"type": "object",
"properties": {
"inceptionDatabase": {
"type": "array",
"items": { "type": "string" }
},
"codebooks": {
"type": "array",
"items": { "type": "string" }
},
"steps": {
"type": "array",
"items": { "type": "string" }
}
}
}
},
"required": ["inceptionDatabase", "steps", "codebooks", "indexFile", "variables", "parameters", "configurationFiles", "dag"]
}
}
}'
)
