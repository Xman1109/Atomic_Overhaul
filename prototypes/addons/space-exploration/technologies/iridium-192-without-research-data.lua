data:extend({

    {
            type = "technology",
            name = "iridium-192-without-research-data",
            icon = se_addon_graphics .. "iridium-192-without-research-data.png",
            icon_size = "256",
            prerequisites = {"iridium-192-reprocessing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "iridium-192-without-research-data-recipe"
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