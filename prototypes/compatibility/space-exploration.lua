-- for some odd reason Space Exploration edits the technologies. This is a workaround for that.
data.raw["technology"]["iridium-192-processing"].prerequisites = {"se-processing-iridium", "thorium-fuel-reprocessing"}
data.raw["technology"]["holmium-166-processing"].prerequisites = {"se-processing-holmium", "iridium-192-processing"}
data.raw["technology"]["beryllium-7-processing"].prerequisites = {"se-processing-beryllium", "holmium-166-processing"}

data.raw["technology"]["iridium-192-processing"].unit.ingredients =
{
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"se-rocket-science-pack", 1},
    {"se-energy-science-pack-1", 1},
    {"research-data", 1}
}
data.raw["technology"]["holmium-166-processing"].unit.ingredients =
{
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"se-rocket-science-pack", 1},
    {"se-energy-science-pack-1", 1},
    {"research-data", 1}
}
data.raw["technology"]["beryllium-7-processing"].unit.ingredients =
{
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"se-rocket-science-pack", 1},
    {"se-energy-science-pack-1", 1},
    {"research-data", 1}
}

data.raw["technology"]["iridium-192-processing"].count = 2750
data.raw["technology"]["holmium-166-processing"].count = 3000
data.raw["technology"]["beryllium-7-processing"].count = 3250