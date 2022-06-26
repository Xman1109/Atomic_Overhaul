data:extend({

    {
            type = "technology",
            name = "holmium-166-without-research-data",
            icon = se_addon_graphics .. "holmium-166-without-research-data.png",
            icon_size = "256",
            prerequisites = {"holmium-166-reprocessing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "holmium-166-without-research-data-recipe"
                }
            },
            unit =
        {
        count = 500,
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