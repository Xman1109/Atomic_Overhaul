-----------------------------------------------------------------------------------------------
-- MadClown01 if you want me to change something then create an issue/pull request on github.--
-----------------------------------------------------------------------------------------------
-- make the plutonium-239 item glow in the dark
resourceGlow("plutonium-239")
data.raw["item-subgroup"]["clowns-uranium-centrifuging"].group = "atomic-overhaul"
data.raw["item-subgroup"]["clowns-uranium-centrifuging"].order = "z"
data.raw["recipe"]["uranium-fuel-cell"].ingredients = {{"35%-uranium", 1}, {"graphite", 19}, {"empty-fuel-cell", 10}}
data.raw["item"]["plutonium-239"].group = "atomic-overhaul"
data.raw["item"]["plutonium-239"].subgroup = "resources"
data.raw["item"]["plutonium-239"].order = "d"
--data.raw["recipe"]["uranium-processing"].results = {{name = "35%-uranium", probability = 0.007, amount = 1}, {name = "uranium-238", probability = 0.993, amount = 1}}
table.insert(data.raw["technology"]["uranium-processing"].effects, {
    type = "unlock-recipe",
    recipe = "clowns-centrifuging-20%-ore"
})
table.insert(data.raw["technology"]["uranium-processing"].effects, {
    type = "unlock-recipe",
    recipe = "clowns-centrifuging-35%"
})
table.insert(data.raw["technology"]["thermonuclear-bomb"].unit.ingredients, {
    type = "item",
    name = "research-data",
    amount = 1
})
replaceEffects("atomic-bomb", {{type = "unlock-recipe", recipe = "atomic-bomb"}})
hideType("t", "kovarex-enrichment-process")
hideType("r", "kovarex-enrichment-process")
hideType("r", "uranium-processing")
hideType("r", "plutonium-atomic-bomb")
hideType("i", "plutonium")
hideType("t", "mixed-oxide-fuel")
hideType("r", "mixed-oxide")


-- remove the uranium-processing recipe from the uranium-processing technology
for i, effect in pairs(data.raw["technology"]["uranium-processing"].effects) do
    if effect.recipe == "uranium-processing" then
        table.remove(data.raw["technology"]["uranium-processing"].effects, i)
    end
end

-- change every recipe with the ingredient plutonium to use plutonium-239
for _, recipe in pairs(data.raw.recipe) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == "plutonium" or ingredient[1] == "plutonium" then
                ingredient[1] = "plutonium-239"
                --log(recipe.name .. " now needs:" .. ingredient[1])
            end
        end
    end
end
-- do the same thing for the results
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.results then
        for _, result in pairs(recipe.results) do
            if result.name == "plutonium" then
                result.name = "plutonium-239"
            end
        end
    end
end
local list = {"centrifuge", "clowns-centrifuging-20%-ore", "clowns-centrifuging-35%", "uranium-fuel-cell"}
-- check if the recipes in the effects are the same as in list2 then remove the recipes in list2 from the nuclear-power tech
for _, tech in pairs(list) do
    for _, effect in pairs(data.raw["technology"]["nuclear-power"].effects) do
        if effect.recipe == tech then
            table.remove(data.raw["technology"]["nuclear-power"].effects, _)
        end
    end
end
