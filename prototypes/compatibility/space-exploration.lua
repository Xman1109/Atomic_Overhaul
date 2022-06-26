if settings.startup["se-addon"].value == true then
-- for some odd reason Space Exploration edits the technologies. This is a workaround for that.
local ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"se-rocket-science-pack", 1},
    {"se-energy-science-pack-1", 1},
    {"research-data", 1}
    }

data.raw["technology"]["iridium-192-processing"].prerequisites = {"se-processing-iridium", "thorium-fuel-reprocessing"}
data.raw["technology"]["holmium-166-processing"].prerequisites = {"se-processing-holmium", "iridium-192-reprocessing"}
data.raw["technology"]["beryllium-7-processing"].prerequisites = {"se-processing-beryllium", "holmium-166-reprocessing"}
data.raw["technology"]["iridium-192-reprocessing"].prerequisites = {"iridium-192-processing"}
data.raw["technology"]["holmium-166-reprocessing"].prerequisites = {"holmium-166-processing"}
data.raw["technology"]["beryllium-7-reprocessing"].prerequisites = {"beryllium-7-processing"}
data.raw["technology"]["iridium-192-without-research-data"].prerequisites = {"iridium-192-reprocessing"}
data.raw["technology"]["holmium-166-without-research-data"].prerequisites = {"holmium-166-reprocessing"}
data.raw["technology"]["beryllium-7-without-research-data"].prerequisites = {"beryllium-7-reprocessing"}

data.raw["technology"]["iridium-192-processing"].unit.ingredients = ingredients
data.raw["technology"]["holmium-166-processing"].unit.ingredients = ingredients
data.raw["technology"]["beryllium-7-processing"].unit.ingredients = ingredients
data.raw["technology"]["iridium-192-reprocessing"].unit.ingredients = ingredients
data.raw["technology"]["holmium-166-reprocessing"].unit.ingredients = ingredients
data.raw["technology"]["beryllium-7-reprocessing"].unit.ingredients = ingredients
data.raw["technology"]["iridium-192-without-research-data"].unit.ingredients = ingredients
data.raw["technology"]["holmium-166-without-research-data"].unit.ingredients = ingredients
data.raw["technology"]["beryllium-7-without-research-data"].unit.ingredients = ingredients


--log("AO-TECH-COUNT: " .. data.raw["technology"]["iridium-192-processing"].count)
data.raw["technology"]["iridium-192-processing"].count = 2750
data.raw["technology"]["holmium-166-processing"].count = 3000
data.raw["technology"]["beryllium-7-processing"].count = 3250
data.raw["technology"]["iridium-192-reprocessing"].count = 2750
data.raw["technology"]["holmium-166-reprocessing"].count = 3000
data.raw["technology"]["beryllium-7-reprocessing"].count = 3250
data.raw["technology"]["iridium-192-without-research-data"].count = 500
data.raw["technology"]["holmium-166-without-research-data"].count = 500
data.raw["technology"]["beryllium-7-without-research-data"].count = 500
log("AO-TECH-COUNT: "..data.raw["technology"]["iridium-192-processing"].count)
end