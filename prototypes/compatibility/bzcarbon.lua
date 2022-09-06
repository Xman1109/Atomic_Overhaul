modifyPrerequisites("ao-graphite-processing", {"graphite-processing"}, "add")
modifyEffects("ao-graphite-processing", {{
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
modifyIngredients("graphite-fuel-cell-recipe", {{"graphite", 25}, {"empty-fuel-cell", 10}})
