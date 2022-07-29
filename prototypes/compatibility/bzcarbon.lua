table.insert(data.raw["technology"]["ao-graphite-processing"].prerequisites, "graphite-processing")
data.raw["technology"]["ao-graphite-processing"].effects = {
    {
        type = "unlock-recipe",
        recipe = "centrifuge"
    },
    {
        type = "unlock-recipe",
        recipe = "empty-fuel-cell-recipe"
    },
    {
        type = "unlock-recipe",
        recipe = "graphite-fuel-cell-recipe"
    }
}
hideType("r", "graphite-recipe")
data.raw["recipe"]["graphite-fuel-cell-recipe"].ingredients = {
    {"graphite", 25},
    {"empty-fuel-cell", 10}
}