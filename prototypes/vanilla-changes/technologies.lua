for _, lab in pairs(data.raw["lab"]) do
    if lab.inputs then
        table.insert(lab.inputs, "research-data")
    end
end
table.insert(data.raw["technology"]["nuclear-fuel-reprocessing"].prerequisites, "uranium-processing")
table.insert(data.raw["technology"]["atomic-bomb"].prerequisites, "plutonium-processing")
table.insert(data.raw["technology"]["atomic-bomb"].unit.ingredients, {"research-data", 1})
table.insert(data.raw["technology"]["nuclear-fuel-reprocessing"].effects, {type = "unlock-recipe", recipe = "research-data-recipe"})
data.raw["technology"]["uranium-processing"].effects = {{type = "unlock-recipe",recipe = "uranium-processing"},{type = "unlock-recipe",recipe = "uranium-fuel-cell"}}
data.raw["technology"]["uranium-processing"].prerequisites = {"graphite-fuel-reprocessing"}
data.raw["technology"]["nuclear-power"].prerequisites = {"ao-graphite-processing"}