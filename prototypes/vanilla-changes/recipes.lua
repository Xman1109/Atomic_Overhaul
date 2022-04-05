table.insert( data.raw["recipe"]["nuclear-fuel-reprocessing"].results, { type = "item", name = "plutonium", amount_min = 1, amount_max = 3})
table.insert( data.raw["recipe"]["nuclear-fuel-reprocessing"].results, { type = "item", name = "nuclear-waste", amount = 5})
table.insert( data.raw["recipe"]["nuclear-fuel-reprocessing"].results, { type = "item", name = "research-data", amount_min = 1, amount_max = 3})
data.raw["recipe"]["uranium-processing"].order = "b"
data.raw["recipe"]["uranium-processing"].subgroup = "resources"
data.raw["recipe"]["nuclear-fuel"].subgroup = "fuel"
data.raw["recipe"]["nuclear-fuel"].order = "a"
data.raw["recipe"]["nuclear-fuel-reprocessing"].subgroup = "reprocessing"
data.raw["recipe"]["nuclear-fuel-reprocessing"].order = "b"
data.raw["recipe"]["uranium-fuel-cell"].category = "advanced-crafting"