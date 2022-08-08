table.insert(data.raw["technology"]["ao-graphite-processing"].prerequisites, "graphite-processing")
replaceEffects("ao-graphite-processing", {{
    type = "unlock-recipe",
    recipe = "centrifuge"
}, {
    type = "unlock-recipe",
    recipe = "empty-fuel-cell-recipe"
}, {
    type = "unlock-recipe",
    recipe = "graphite-fuel-cell-recipe"
}})
hideType("r", "graphite-recipe")
replaceIngredients("graphite-fuel-cell-recipe", {{"graphite", 25}, {"empty-fuel-cell", 10}})
