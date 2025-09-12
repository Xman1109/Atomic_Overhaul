data:extend({
    {
        type = "technology",
        name = "isotope-analysis",
        icon = graphics .. "isotope-analysis.png",
        icon_size = 256,
        visible_when_disabled = true,
        enabled = false,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "isotope-data-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "xenon-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "muonium-recipe"
            }
        },
        prerequisites = {"waste-reprocessing", "processing-unit"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"research-data", 1},
            },
            time = 30
        }
    }
})