if settings.startup["se-addon"].value == true then
table.insert(data.raw["technology"]["se-antimatter-reactor"].prerequisites, "space-reactor")
data.raw["reactor"]["nuclear-reactor"].collision_mask = data.raw["transport-belt"]["transport-belt"].collision_mask or data.raw["assembling-machine"]["assembling-machine-1"].collision_mask
data.raw["tool"]["research-data"].order = "zz"
data.raw["recipe"]["research-data-recipe"].order = "zz"
end