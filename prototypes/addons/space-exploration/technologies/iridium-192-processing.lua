data:extend({

    {
            type = "technology",
            name = "iridium-192-processing",
            icon = se_addon_graphics .. "iridium-192-processing.png",
            icon_size = 256,
            prerequisites = {"se-processing-iridium", "space-reactor"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "iridium-192-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "iridium-rod-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "iridium-fuel-cell-recipe"
                }
            },
            unit =
        {
        count = 2750,
        ingredients =
        {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"se-rocket-science-pack", 1},
            {"se-energy-science-pack-1", 1},
            {"research-data", 1}
        },
        time = 50
        }
    }
})