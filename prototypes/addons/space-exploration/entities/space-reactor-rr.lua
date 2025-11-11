--doesnt work yet
local sr = table.deepcopy(data.raw["reactor"]["realistic-reactor-normal"])
sr.name = "space-reactor"
sr.energy_source.fuel_categories = nil
sr.energy_source.fuel_categories = {"space-nuclear-fuel"}

data:extend({sr})