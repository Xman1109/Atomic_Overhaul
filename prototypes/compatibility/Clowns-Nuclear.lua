Glow("plutonium-239")
regroup("is", "clowns-uranium-centrifuging", "AO", nil, "z")
modifyIngredients("uranium-fuel-cell", { { "35%-uranium", 1 }, { "graphite", 19 }, { "empty-fuel-cell", 10 } })
regroup("i", "AO", "resources", "d")
modifyEffects("uranium-processing", { {
    type = "unlock-recipe",
    recipe = "clowns-centrifuging-20%-ore"
}, {
    type = "unlock-recipe",
    recipe = "clowns-centrifuging-35%"
} })
addResearchData("thermonuclear-bomb")
modifyEffects("atomic-bomb", { {
    type = "unlock-recipe",
    recipe = "atomic-bomb"
} })
hideType("t", "kovarex-enrichment-process")
hideType("r", "kovarex-enrichment-process")
hideType("r", "uranium-processing")
hideType("r", "plutonium-atomic-bomb")
hideType("i", "plutonium")
hideType("t", "mixed-oxide-fuel")
hideType("r", "mixed-oxide")
for i, effect in pairs(data.raw["technology"]["uranium-processing"].effects) do
    if effect.recipe == "uranium-processing" then
        table.remove(data.raw["technology"]["uranium-processing"].effects, i)
    end
end
for _, recipe in pairs(data.raw.recipe) do
    if recipe.ingredients then
        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.name == "plutonium" or ingredient[1] == "plutonium" then
                ingredient[1] = "plutonium-239"

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
local list = { "centrifuge", "clowns-centrifuging-20%-ore", "clowns-centrifuging-35%", "uranium-fuel-cell" }
for _, tech in pairs(list) do
    for _, effect in pairs(data.raw["technology"]["nuclear-power"].effects) do
        if effect.recipe == tech then
            table.remove(data.raw["technology"]["nuclear-power"].effects, _)
        end
    end
end
