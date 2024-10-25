Glow({ "thorium-232", "plutonium-239", "polonium-210", "caesium-137", "strontium-90", "protactinium-231", "zinc-65",
    "cobalt-60" })
Glow({ "hypernuclear-fuel", "turbonuclear-fuel", "radiothermal-fuel", "superradiothermal-fuel", "ultraradiothermal-fuel" }
    , "fuel")
regroup("r", "advanced-nuclear-fuel-reprocessing", nil, nil,
    "b[nuclear-fuel-reprocessing]-c[advanced-nuclear-fuel-reprocessing]")
regroup("r", "thorium-nuclear-fuel-reprocessing", nil, nil, "f")
regroup("r", "advanced-thorium-nuclear-fuel-reprocessing", nil, nil, "g")
regroup("r", "advanced-thorium-nuclear-fuel-reprocessing|b", nil, nil, "h")
regroup("r", "nuclear-fuel", nil, "fuel", "a")
regroup("r", "hypernuclear-fuel", nil, "fuel", "b")
regroup("r", "turbonuclear-fuel", nil, "fuel", "c")
regroup("r", "radiothermal-fuel", nil, "fuel", "d")
regroup("r", "superradiothermal-fuel", nil, "fuel", "e")
regroup("r", "ultraradiothermal-fuel", nil, "fuel", "f")
regroup("r", "thorium-processing", nil, "resources", "g")
regroup("r", "thorium-purification", nil, "resources", "h")
regroup("r", "thorium-mixed-oxide", nil, "fuel-cells", "g")
regroup("r", "thorium-fuel-cell", nil, "fuel-cells", "f")
data.raw["item"]["thorium-fuel-cell"].icon = graphics .. "thorium-fuel-cell.png"
data.raw["item"]["thorium-fuel-cell"].icon_size = 64
data.raw["item"]["thorium-fuel-cell"].icon_mipmaps = 4
data.raw["item"]["used-up-thorium-fuel-cell"].icon = graphics .. "thorium-used-up-fuel-cell.png"
data.raw["item"]["used-up-thorium-fuel-cell"].icon_size = 64
data.raw["item"]["used-up-thorium-fuel-cell"].icon_mipmaps = 4
data.raw["recipe"]["nuclear-fuel-reprocessing"].icon = base_graphics .. "nuclear-fuel-reprocessing.png"
data.raw["recipe"]["nuclear-fuel-reprocessing"].icon_size = 64
data.raw["recipe"]["nuclear-fuel-reprocessing"].icon_mipmaps = 4
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
} })
hideType("r", { "plutonium-atomic-bomb", "plutonium-fuel-recipe", "kovarex-enrichment-process", "uranium-processing" })
hideType("t", { "thorium-processing", "plutonium-fuel", "kovarex-enrichment-process" })
regroup("is", "clowns-uranium-centrifuging", "AO", nil, "z")
regroup("is", "clowns-nuclear-cells", "AO", nil, "z")
modifyPrerequisites("radiothermal-fuel-1", { "plutonium-processing" })

modifyPrerequisites("thorium-module", { "thorium-ore-processing" })
modifyEffects("thorium-ore-processing", { {
    type = "unlock-recipe",
    recipe = "thorium-recipe"
} }, "add")
modifyPrerequisites("thorium-ore-processing", { "MOX-fuel-reprocessing" }, "add")
modifyPrerequisites("thorium-nuclear-fuel-reprocessing-2", { "thorium-fuel-reprocessing" })
modifyPrerequisites("thorium-fuel-reprocessing", { "thorium-ore-processing" })
modifyEffects("uranium-processing", { {
    type = "unlock-recipe",
    recipe = "clowns-centrifuging-20%-ore"
}, {
    type = "unlock-recipe",
    recipe = "clowns-centrifuging-35%"
} }, "add")
modifyIngredients("uranium-fuel-cell", { {type="item", name="35%-uranium", 1 }, {type="item", name="graphite", amount=19}, { "empty-fuel-cell", amount=10} })
modifyEffects("mixed-oxide-fuel", { {
    type = "unlock-recipe",
    recipe = "thorium-mixed-oxide"
} }, "add")
data.raw["recipe"]["thorium-mixed-oxide"].icon = graphics .. "thorium-fuel-cell.png"
data.raw["recipe"]["thorium-mixed-oxide"].icon_size = 64
data.raw["recipe"]["thorium-mixed-oxide"].icon_mipmaps = 4
modifyEffects("thorium-ore-processing", { {
    type = "unlock-recipe",
    recipe = "thorium-processing"
} }, "add")
for i, effect in pairs(data.raw["technology"]["uranium-processing"].effects) do
    if effect.recipe == "uranium-processing" then
        table.remove(data.raw["technology"]["uranium-processing"].effects, i)
    end
end
if mods["RealisticReactors"] then
    data.raw["recipe"]["mixed-oxide"].hidden = true
    if ao_debug == true then
        log(debug_text .. "RealisticReactors")
    end
end
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == "thorium" then
                ingredient.name = "thorium-232"
            end
        end
    end
end

for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result.name == "thorium" then
                result.name = "thorium-232"
            end
        end
    end
end
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == "plutonium" then
                ingredient.name = "plutonium-239"
            end
        end
    end
end
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result.name == "plutonium" then
                result.name = "plutonium-239"
            end
        end
    end
end
addResearchData({ "nuclear-fuel-reprocessing-2", "thorium-nuclear-fuel-reprocessing-2", "thorium-ore-processing",
    "thermonuclear-bomb", "advanced-uranium-processing-1", "advanced-uranium-processing-2",
    "radiothermal-fuel-1", "radiothermal-fuel-2", "radiothermal-fuel-3", "nuclear-fuel-2", "nuclear-fuel-3" })

local list2 = { "centrifuge", "clowns-centrifuging-20%-ore", "clowns-centrifuging-35%", "uranium-fuel-cell" }

for _, tech in pairs(list2) do
    for _, effect in pairs(data.raw["technology"]["nuclear-power"].effects) do
        if effect.recipe == tech then
            table.remove(data.raw["technology"]["nuclear-power"].effects, _)
        end
    end
end
local list3 = { "thorium-nuclear-fuel-reprocessing", "advanced-nuclear-fuel-reprocessing",
    "advanced-thorium-nuclear-fuel-reprocessing", "advanced-thorium-nuclear-fuel-reprocessing|b" }

for _, recipe in pairs(list3) do
    data.raw["recipe"][recipe].subgroup = "reprocessing"
end
data:extend({ {
    type = "recipe",
    name = "atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients = { {type="item", name="processing-unit", 10 }, {type="item", name="explosives", 25 }, { "uranium-235", amount=30}, { "plutonium", amount=15},
        {type="item", name="rocket", amount=3} },
    results = {{ type = "item", name = "atomic-bomb", amount = 1 }}
} })
