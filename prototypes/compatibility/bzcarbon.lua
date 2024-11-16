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
hideType("r", "graphite-furnace-recipe")
modifyIngredients("graphite-fuel-cell-recipe", {{type="item", name="graphite", 25}, {"empty-fuel-cell", amount=10}})
