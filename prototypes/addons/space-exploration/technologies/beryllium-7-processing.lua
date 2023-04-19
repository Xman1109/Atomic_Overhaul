data:extend({

    {
            type = "technology",
            name = "beryllium-7-processing",
            icon = se_addon_graphics .. "beryllium-7-processing.png",
            icon_size = "256",
            prerequisites = {"se-processing-beryllium", "holmium-166-reprocessing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "beryllium-7-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "beryllium-rod-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "beryllium-fuel-cell-recipe"
                }
            },
            unit =
        {
        count = 3250,
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