table.insert( data.raw["recipe"]["nuclear-fuel-reprocessing"].results, { type = "item", name = "plutonium", amount_min = 1, amount_max = 3})
table.insert( data.raw["recipe"]["nuclear-fuel-reprocessing"].results, { type = "item", name = "nuclear-waste", amount = 5})
data.raw["recipe"]["uranium-fuel-cell"].order = "b"
data.raw["recipe"]["uranium-fuel-cell"].subgroup = "fuel-cells"