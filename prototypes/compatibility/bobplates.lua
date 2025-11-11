Glow({ "bob-thorium-232", "bob-plutonium-239" })
Glow({ "deuterium-fuel-cell", "deuterium-fuel-cell-2", "thorium-plutonium-fuel-cell", "thorium-fuel-cell",
    "bob-plutonium-fuel-cell" }, "cell")
modifyResults("nuclear-fuel-reprocessing", { {
    type = "item",
    name = "plutonium",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "uranium-238",
    amount = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "bob-fusion-catalyst",
    amount = 1
} })
modifyResults("thorium-fuel-reprocessing", { {
    type = "item",
    name = "thorium",
    amount_min = 2,
    amount_max = 3
}, {
    type = "item",
    name = "uranium-235",
    amount = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 15
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "bob-fusion-catalyst",
    amount = 1
} })
regroup("r", "bob-plutonium-fuel-cell", nil, data.raw["recipe"]["plutonium-fuel-cell-recipe"].subgroup,
    data.raw["recipe"]["plutonium-fuel-cell-recipe"].order)
regroup("r", "bob-empty-nuclear-fuel-cell", nil, "fuel-cells", "z")
regroup("r", "bob-thorium-fuel-cell", nil, data.raw["recipe"]["thorium-fuel-cell-recipe"].subgroup,
    data.raw["recipe"]["thorium-fuel-cell-recipe"].order)
regroup("r", "bob-thorium-processing", nil, "resources", "f")
regroup("r", "bob-thorium-plutonium-fuel-cell", nil, "fuel-cells", "g")
regroup("r", "deuterium-fuel-cell", nil, "fuel-cells", "h")
regroup("r", "bob-deuterium-fuel-cell-2", nil, "fuel-cells", "i")
regroup("r", "bob-thorium-fuel-reprocessing", nil, "reprocessing", "e")
regroup("r", "bob-deuterium-fuel-reprocessing", nil, "reprocessing", "f")
regroup("i", "bob-empty-nuclear-fuel-cell", nil, "fuel-cells", "z")
regroup("i", "bob-thorium-fuel-cell", nil, "fuel-cells", "e")
regroup("i", "bob-thorium-plutonium-fuel-cell", nil, "fuel-cells", "f")
regroup("i", "bob-deuterium-fuel-cell", nil, "fuel-cells", "g")
regroup("i", "bob-deuterium-fuel-cell-2", nil, "fuel-cells", "h")
regroup("i", "bob-plutonium-fuel-cell", nil, "fuel-cells", "c")
regroup("i", "bob-thorium-232", nil, "resources", "f")
regroup("i", "bob-plutonium-239", nil, "resources", "d")
regroup("i", "bob-used-up-thorium-fuel-cell", nil, "bob-used-up-fuel-cells", "e")
regroup("i", "bob-used-up-deuterium-fuel-cell", nil, "bob-used-up-fuel-cells", "f")
iconizer("r", "bob-plutonium-fuel-cell-recipe", "r", "bob-plutonium-fuel-cell")
iconizer("r", "bob-thorium-fuel-cell-recipe", "r", "bob-thorium-fuel-cell")
iconizer("r", "bob-empty-fuel-cell-recipe", "r", "bob-empty-nuclear-fuel-cell")
iconizer("r", "bob-plutonium-fuel-cell-recipe", "i", "bob-plutonium-fuel-cell")
iconizer("r", "bob-thorium-fuel-cell-recipe", "i", "bob-thorium-fuel-cell")
iconizer("r", "bob-empty-fuel-cell-recipe", "i", "bob-empty-nuclear-fuel-cell")

data.raw["technology"]["bob-thorium-plutonium-fuel-cell"].icon_size = 64

modifyEffects("ao-graphite-processing", { {
    type = "unlock-recipe",
    recipe = "centrifuge"
}, {
    type = "unlock-recipe",
    recipe = "graphite-furnace-recipe"
}, {
    type = "unlock-recipe",
    recipe = "empty-nuclear-fuel-cell"
}, {
    type = "unlock-recipe",
    recipe = "graphite-fuel-cell-recipe"
} })

modifyEffects("plutonium-processing", { {
    type = "unlock-recipe",
    recipe = "bob-plutonium-fuel-cell"
}, {
    type = "unlock-recipe",
    recipe = "bobingabout-enrichment-process"
}, {
    type = "unlock-recipe",
    recipe = "bob-plutonium-nucleosynthesis"
} })

modifyPrerequisites("bob-thorium-processing", { "MOX-fuel-reprocessing" })
modifyPrerequisites("bob-deuterium-processing", { "bob-thorium-fuel-reprocessing" })
modifyPrerequisites("bob-thorium-plutonium-fuel-cell", { "bob-thorium-processing", "plutonium-processing" })
addResearchData("bob-thorium-processing")

data.raw["technology"]["thorium-module"].prerequisites = { "bob-thorium-processing", "speed-module",
    "productivity-module" }
data.raw["technology"]["waste-reprocessing"].prerequisites = { "bob-thorium-processing" }
hideType("t", { "thorium-processing", "thorium-fuel-reprocessing", "thorium-without-research-data" })
hideType("r", { "thorium-without-research-data", "thorium-recipe" })

for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == "empty-fuel-cell" then
                ingredient.name = "bob-empty-nuclear-fuel-cell"
            end
            if ingredient.name == "plutonium" then
                ingredient.name = "bob-plutonium-239"
            end
            if ingredient.name == "thorium" then
                ingredient.name = "bob-thorium-232"
            end
        end
    end
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result.name == "empty-fuel-cell" then
                result.name = "bob-empty-nuclear-fuel-cell"
            end
            if result.name == "plutonium" then
                result.name = "bob-plutonium-239"
            end
            if result.name == "thorium" then
                result.name = "bob-thorium-232"
            end
        end
    end
end

local list = { "bob-thorium-processing", "bob-thorium-fuel-reprocessing", "bob-thorium-plutonium-fuel-cell",
    "bob-deuterium-processing",
    "bob-deuterium-fuel-cell-2", "bob-deuterium-fuel-reprocessing" }
for _, tech in pairs(list) do
    data.raw["technology"][tech].unit.ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 },
        { "chemical-science-pack",   1 }, { "production-science-pack", 1 },
        { "research-data", 1 } }
end

hideType("r", { "plutonium-fuel-cell-recipe", "empty-fuel-cell-recipe" })
hideType("t", { "bob-plutonium-fuel-cell", "bobingabout-enrichment-process" })
hideType("i", { "thorium-depleted-cell", "empty-fuel-cell" })
